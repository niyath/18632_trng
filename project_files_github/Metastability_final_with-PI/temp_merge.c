
/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "xgpio.h"

//###################MY DEFINES######################################//

#define BRAM_FULL_CHANNEL 1
#define UART_COMPLETE_CHANNEL 2
#define BRAM_DEPTH 2048
#define BRAM_INTERRUPT XGPIO_IR_CH1_MASK  /* Channel 1 Interrupt Mask */

#define CLK_DELAY_CTRL_CHANNEL  1
#define DATA_DELAY_CTRL_CHANNEL 2


#define TEST_BUFFER_SIZE 100
#define GPIO_ADDR XPAR_AXI_GPIO_0_BASEADDR
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_INT_IRQ_ID	XPAR_XUARTPS_1_INTR
#define FINE_DELAY_LEVELS 64
#define COARSE_DELAY_LEVELS 64
#define COARSE_CTRL 1
#define FINE_CTRL 2
//###################MY DEFINES######################################//

//###################GLOBAL_VARIABLES######################################//

XUartPs Uart_Ps;		/* The instance of the UART Driver */
XScuGic InterruptController;	/* Instance of the Interrupt Controller */
XUartPs_Config *Config;
u8 testval = 5;
u8 recvTout = 0;

static XScuGic_Config *GicConfig;
volatile int InterruptCount; /* Count of interrupts that have occured */

static u32* BRAM_BASE_ADDRESS = (u32 *)0x40000000;
static XGpio Gpio,Gpio_coarse,Gpio_fine; /* The Instance of the GPIO Driver */

static u8 RecvBuffer[TEST_BUFFER_SIZE];	/* Buffer for Receiving Data */
static u8 uartBuffer[TEST_BUFFER_SIZE];
volatile int TotalReceivedCount;
volatile int TotalSentCount;
int TotalErrorCount;


static int coarse_clk_delay_ctrl = 0;
static int coarse_clk_delay_val = 0;


static int coarse_data_delay_ctrl = 0;
static int coarse_data_delay_val = 0;

static int fine_clk_delay_ctrl = 0;
static int fine_clk_delay_val=0;

static int fine_data_delay_ctrl = 0;
static int fine_data_delay_val=0;

static u8 CTRL_TYPE = COARSE_CTRL;
char test;
//###################GLOBAL_VARIABLES######################################//


//###################FUNCTIONS######################################//
void read_bram()
{
	int index;
	int i;
	for (index=0;index< BRAM_DEPTH ;index++)
	{

		u32 *addr = &BRAM_BASE_ADDRESS[index];
		u32 value = *addr;
		u8 my_char; 			//xil_printf("%08x\n",value); should do a uart send

		for( i=0; i< 8; i++)
		{
			my_char = ((value >>i*4) &0xF) + '0';

			if(my_char >'9')
				my_char += 'A' -'9';

			XUartPs_Send(&Uart_Ps, &my_char, 1);
		}
		my_char = 10;
		XUartPs_Send(&Uart_Ps, &my_char, 1);
		test = 13;
		XUartPs_Send(&Uart_Ps, &my_char, 1);


	}
}



static void Bram_full_InterruptHandler(void *InstancePtr)
{

	XGpio *GpioPtr = (XGpio *)InstancePtr;

	//read_bram();
	//	xil_printf(" \n %d \n",InterruptCount);



	char interrupt_char = 'z';

	// Disable the interrupt

	XGpio_InterruptDisable(GpioPtr, BRAM_INTERRUPT);

	// Keep track of the number of interrupts that occur

	InterruptCount = InterruptCount+2;
	//test = 13;
//	XUartPs_Recv(&Uart_Ps,  &interrupt_char,1);

//	XUartPs_Send(&Uart_Ps, &interrupt_char, 1);
		xil_printf("hello in interrupt \n");
	//read_bram();

	// read_bram() ;
	//	u32 *addr = &BRAM_BASE_ADDRESS[1024];
	//	u32 value = *addr;
	//	xil_printf("%08x\n",value);


	// Clear the interrupt such that it is no longer pending in the GPIO

	(void)XGpio_InterruptClear(GpioPtr, BRAM_INTERRUPT);

	// enable interrupts again

	XGpio_DiscreteWrite(GpioPtr,UART_COMPLETE_CHANNEL,0x1);

	InterruptCount = InterruptCount -1 ;
	XGpio_DiscreteWrite(GpioPtr,UART_COMPLETE_CHANNEL,0x0);
	XGpio_InterruptEnable(GpioPtr, BRAM_INTERRUPT);

}
int SetupInterruptSystem_bram_full(XScuGic *XScuGicInstancePtr)
{
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, XScuGicInstancePtr);
	Xil_ExceptionEnable();
	return XST_SUCCESS;

}
int intialize_bramfullinterrupt_system (device_id)
{
	int status;

	GicConfig = XScuGic_LookupConfig(device_id);
	if( GicConfig ==NULL)
		return XST_FAILURE;

	status = XScuGic_CfgInitialize( &InterruptController ,GicConfig,GicConfig->CpuBaseAddress);
	if (status != XST_SUCCESS)
		return XST_FAILURE;


	XScuGic_SetPriorityTriggerType(&InterruptController, XPAR_FABRIC_AXI_GPIO_1_IP2INTC_IRPT_INTR,
			0xA0, 0x3);


	status = SetupInterruptSystem_bram_full (&InterruptController );
	if (status != XST_SUCCESS)
		return XST_FAILURE;

	status =XScuGic_Connect (&InterruptController , XPAR_FABRIC_AXI_GPIO_1_IP2INTC_IRPT_INTR,
			(Xil_ExceptionHandler) Bram_full_InterruptHandler,(void *)&Gpio);
	/*
	 * Enable the interrupt for the GPIO device.
	 */
	XScuGic_Enable(&InterruptController, XPAR_FABRIC_AXI_GPIO_1_IP2INTC_IRPT_INTR );


	/*
	 * Enable the GPIO channel interrupts so that push button can be
	 * detected and enable interrupts for the GPIO device
	 */
	XGpio_InterruptEnable(&Gpio, BRAM_INTERRUPT);
	XGpio_InterruptGlobalEnable(&Gpio);
	/*
	 * Initialize the exception table and register the interrupt
	 * controller handler with the exception table
	 */
	Xil_ExceptionInit();

	if (status != XST_SUCCESS)
		return XST_FAILURE;
	return XST_SUCCESS;

}


//void print(char *str);
static int SetupInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId);

void Uart_keyboard_Handler(void *CallBackRef, u32 Event, unsigned int EventData);

void adjust_delay()
{

	if( CTRL_TYPE == COARSE_CTRL)
	{
		XGpio_DiscreteWrite(&Gpio_coarse,CLK_DELAY_CTRL_CHANNEL ,coarse_clk_delay_ctrl);
		XGpio_DiscreteWrite(&Gpio_coarse,DATA_DELAY_CTRL_CHANNEL ,coarse_data_delay_ctrl);

	}
	else
	{
		XGpio_DiscreteWrite(&Gpio_fine ,DATA_DELAY_CTRL_CHANNEL ,fine_clk_delay_ctrl);

		XGpio_DiscreteWrite(&Gpio_fine ,DATA_DELAY_CTRL_CHANNEL ,fine_data_delay_ctrl);
	}

}


int main()
{
    init_platform();
    int Status;
    u32 IntrMask;
 
 	Status = XGpio_Initialize(&Gpio_coarse, XPAR_GPIO_0_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XGpio_Initialize(&Gpio_fine, XPAR_GPIO_1_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
		XGpio_SelfTest(&Gpio_coarse);
	XGpio_SelfTest(&Gpio_fine);

	XGpio_SetDataDirection(&Gpio_coarse, CLK_DELAY_CTRL_CHANNEL, 0xFFFF);
	XGpio_SetDataDirection(&Gpio_coarse, DATA_DELAY_CTRL_CHANNEL, 0xFFFF);


	XGpio_SetDataDirection(&Gpio_fine, CLK_DELAY_CTRL_CHANNEL, 0xFFFF);
	XGpio_SetDataDirection(&Gpio_fine, DATA_DELAY_CTRL_CHANNEL, 0xFFFF);
	

	//##################### KEYBOARD UART  INIT#############################################

	Config = XUartPs_LookupConfig(0);
    if (NULL == Config) {
    	return XST_FAILURE;
    }

    Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
    	return XST_FAILURE;
    }

    XUartPs_SetBaudRate(&Uart_Ps, 115200);

    
   	// Check hardware build.
   	
   	Status = XUartPs_SelfTest(&Uart_Ps);
   	if (Status != XST_SUCCESS) {
   		return XST_FAILURE;
   	}

   	
   	//  Connect the UART to the interrupt subsystem such that interrupts
   	//  can occur. This function is application specific.
   	 
   	Status = SetupInterruptSystem(&InterruptController, &Uart_Ps, UART_INT_IRQ_ID);
   	if (Status != XST_SUCCESS) {
   		return XST_FAILURE;
   	}

   	
    // Setup the handlers for the UART that will be called from the
   	 // interrupt context when data has been sent and received, specify
   	//  a pointer to the UART driver instance as the callback reference
   	//  so the handlers are able to access the instance data
   	 
   	XUartPs_SetHandler(&Uart_Ps, (XUartPs_Handler)Uart_keyboard_Handler, &Uart_Ps);

   	
   	// Enable the interrupt of the UART so interrupts will occur
   	///
   	IntrMask =
   		XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
   		XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
   		XUARTPS_IXR_RXOVR;
   	XUartPs_SetInterruptMask(&Uart_Ps, IntrMask);

   	
   	//  Set the receiver timeout. If it is not set, and the last few bytes
   	 
   	XUartPs_SetRecvTimeout(&Uart_Ps, 255);
	//##################### KEYBOARD UART  INIT#############################################

/*
	
	
		//##################### BRAM_FULL GPIO  INIT#############################################

	Status = XGpio_Initialize(&Gpio, XPAR_AXI_GPIO_1_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

		XGpio_SelfTest(&Gpio);

	XGpio_SetDataDirection(&Gpio, BRAM_FULL_CHANNEL, 0xFFFF);
	XGpio_SetDataDirection(&Gpio, UART_COMPLETE_CHANNEL, 0);


	//	xil_printf("GPIO Interrupt Example Test \r\n");

	intialize_bramfullinterrupt_system(XPAR_PS7_SCUGIC_0_DEVICE_ID); // param value = 0
	//##################### BRAM_FULL GPIO  INIT#############################################


*/
	
		//##################### DELAY CTRL GPIO INIT#############################################
	//##################### DELAY CTRL GPIO  INIT#############################################
	

   	while(1);

    cleanup_platform();
    return 0;
}

/*****************************************************************************/
/**
*
* This function sets up the interrupt system so interrupts can occur for the
* Uart. This function is application-specific. The user should modify this
* function to fit the application.
*
* @param	IntcInstancePtr is a pointer to the instance of the INTC.
* @param	UartInstancePtr contains a pointer to the instance of the UART
*		driver which is going to be connected to the interrupt
*		controller.
* @param	UartIntrId is the interrupt Id and is typically
*		XPAR_<UARTPS_instance>_INTR value from xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
****************************************************************************/
static int SetupInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId)
{
	int Status;

#ifndef TESTAPP_GEN
	XScuGic_Config *IntcConfig; /* Config for interrupt controller */

	/*
	 * Initialize the interrupt controller driver
	 */
	IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
	if (NULL == IntcConfig) {
		return XST_FAILURE;
	}

	Status = XScuGic_CfgInitialize(IntcInstancePtr, IntcConfig,
					IntcConfig->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the interrupt controller interrupt handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				(Xil_ExceptionHandler) XScuGic_InterruptHandler,
				IntcInstancePtr);
#endif

	/*
	 * Connect a device driver handler that will be called when an
	 * interrupt for the device occurs, the device driver handler
	 * performs the specific interrupt processing for the device
	 */
	Status = XScuGic_Connect(IntcInstancePtr, UartIntrId,
				  (Xil_ExceptionHandler) XUartPs_InterruptHandler,
				  (void *) UartInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupt for the device
	 */
	XScuGic_Enable(IntcInstancePtr, UartIntrId);


#ifndef TESTAPP_GEN
	/*
	 * Enable interrupts
	 */
	 Xil_ExceptionEnable();
#endif

	return XST_SUCCESS;
}

/**************************************************************************/
/**
*
* This function is the handler which performs processing to handle data events
* from the device.  It is called from an interrupt context. so the amount of
* processing should be minimal.
*
* This handler provides an example of how to handle data for the device and
* is application specific.
*
* @param	CallBackRef contains a callback reference from the driver,
*		in this case it is the instance pointer for the XUartPs driver.
* @param	Event contains the specific kind of event that has occurred.
* @param	EventData contains the number of bytes sent or received for sent
*		and receive events.
*
* @return	None.
*
* @note		None.
*
***************************************************************************/
void Uart_keyboard_Handler(void *CallBackRef, u32 Event, unsigned int EventData)
{
	/*
	 * All of the data has been sent
	 */
	if (Event == XUARTPS_EVENT_SENT_DATA);

	/*
	 * All of the data has been received
	 */
	if (Event == XUARTPS_EVENT_RECV_DATA)
	{
		recvTout++;
		memcpy((u8*)0x41220000, &recvTout,1);
		XUartPs_Recv(&Uart_Ps, uartBuffer, TEST_BUFFER_SIZE);
		if(uartBuffer[2] == 0x41)
		{//Up Arrow: 1B 5B 41
			//	memcpy((u8*)0x41220000, &recvTout,1);

			if(coarse_clk_delay_ctrl != (COARSE_DELAY_LEVELS -1))
				coarse_clk_delay_ctrl++;
			CTRL_TYPE =COARSE_CTRL;
			adjust_delay();
			//test = 'W';
		}
		if(uartBuffer[2] == 0x42)
		{//Down Arrow: 1B 5B 42
			if(coarse_clk_delay_ctrl != 0)
				coarse_clk_delay_ctrl--;
			CTRL_TYPE =COARSE_CTRL;
		//	adjust_delay();
			//test = 'S';

		}
		if(uartBuffer[2] == 0x43)
		{//Right Arrow: 1B 5B 43
			if(coarse_data_delay_ctrl != (COARSE_DELAY_LEVELS -1))
				coarse_data_delay_ctrl++;

			CTRL_TYPE =COARSE_CTRL;
		//	adjust_delay();
			//test = 'D';
		}
		if(uartBuffer[2] == 0x44)
		{//Left Arrow: 1B 5B 44
			if(coarse_data_delay_ctrl != 0)
				coarse_data_delay_ctrl--;

			CTRL_TYPE =COARSE_CTRL;
		//	adjust_delay();
			//test = 'A';
		}
			if(uartBuffer[0] == 0x77)
		{//w :
			if(fine_clk_delay_ctrl != (FINE_DELAY_LEVELS -1))
				fine_clk_delay_ctrl++;

			CTRL_TYPE =FINE_CTRL;
		//	adjust_delay();

		}
		if(uartBuffer[0] == 0x73)
		{//s:
			if(fine_clk_delay_ctrl != 0)
				fine_clk_delay_ctrl--;

			CTRL_TYPE =FINE_CTRL;
		//	adjust_delay();
		}
		if(uartBuffer[0] == 0x64)
			{//d
				if(fine_data_delay_ctrl != (FINE_DELAY_LEVELS-1))
					fine_data_delay_ctrl++;

				CTRL_TYPE =FINE_CTRL;
		//		adjust_delay();

			}

		if(uartBuffer[0] == 0x61)
		{//a
			if(fine_data_delay_ctrl != 0)
				fine_data_delay_ctrl--;

			CTRL_TYPE =FINE_CTRL;
		//	adjust_delay();

		}


		coarse_clk_delay_val =  coarse_clk_delay_ctrl;//(1<< coarse_clk_delay_ctrl) -1;
		coarse_data_delay_val =  coarse_data_delay_ctrl;//(1<< coarse_data_delay_ctrl) -1;

	//adjust_delay();
		/*
	if( CTRL_TYPE == COARSE_CTRL)
	{
		XGpio_DiscreteWrite(&Gpio_coarse,CLK_DELAY_CTRL_CHANNEL ,coarse_clk_delay_val);
		XGpio_DiscreteWrite(&Gpio_coarse,DATA_DELAY_CTRL_CHANNEL ,coarse_data_delay_val);

	}
	else
	{
		XGpio_DiscreteWrite(&Gpio_fine ,DATA_DELAY_CTRL_CHANNEL ,fine_clk_delay_val);

		XGpio_DiscreteWrite(&Gpio_fine ,DATA_DELAY_CTRL_CHANNEL ,fine_data_delay_val);
	}
	*/
		//adjust_delay();

		if(CTRL_TYPE == COARSE_CTRL)
		{
		test = 33 + coarse_clk_delay_ctrl;
		XUartPs_Send(&Uart_Ps, &test, 1)	;
		test = 10;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 13;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 33 + coarse_data_delay_ctrl;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 10;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 13;
		XUartPs_Send(&Uart_Ps, &test, 1);
		//XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);
		}
		else
		{
			test = 33 + fine_clk_delay_ctrl;
			XUartPs_Send(&Uart_Ps, &test, 1)	;
			test = 10;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 13;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 33 + fine_data_delay_ctrl;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 10;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 13;
			XUartPs_Send(&Uart_Ps, &test, 1);
					//XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);

		}



	}


	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT)
	{
		recvTout++;
		memcpy((u8*)0x41220000, &recvTout,1);
		XUartPs_Recv(&Uart_Ps, uartBuffer, TEST_BUFFER_SIZE);
		if(uartBuffer[2] == 0x41)
		{//Up Arrow: 1B 5B 41
			//	memcpy((u8*)0x41220000, &recvTout,1);

			if(coarse_clk_delay_ctrl != (COARSE_DELAY_LEVELS -1))
				coarse_clk_delay_ctrl++;
			CTRL_TYPE =COARSE_CTRL;
		//	adjust_delay();
			//test = 'W';
		}
		if(uartBuffer[2] == 0x42)
		{//Down Arrow: 1B 5B 42
			if(coarse_clk_delay_ctrl != 0)
				coarse_clk_delay_ctrl--;
			CTRL_TYPE =COARSE_CTRL;
	//		adjust_delay();
			//test = 'S';

		}
		if(uartBuffer[2] == 0x43)
		{//Right Arrow: 1B 5B 43
			if(coarse_data_delay_ctrl != (COARSE_DELAY_LEVELS -1))
				coarse_data_delay_ctrl++;

			CTRL_TYPE =COARSE_CTRL;
	//		adjust_delay();
			//test = 'D';
		}
		if(uartBuffer[2] == 0x44)
		{//Left Arrow: 1B 5B 44
			if(coarse_data_delay_ctrl != 0)
				coarse_data_delay_ctrl--;

			CTRL_TYPE =COARSE_CTRL;
			adjust_delay();
			//test = 'A';
		}
			if(uartBuffer[0] == 0x77)
		{//w :
			if(fine_clk_delay_ctrl != (FINE_DELAY_LEVELS -1))
				fine_clk_delay_ctrl++;

			CTRL_TYPE =FINE_CTRL;
	//		adjust_delay();

		}
		if(uartBuffer[0] == 0x73)
		{//s:
			if(fine_clk_delay_ctrl != 0)
				fine_clk_delay_ctrl--;
			CTRL_TYPE =FINE_CTRL;
	//		adjust_delay();
		}
		if(uartBuffer[0] == 0x64)
			{//d
				if(fine_data_delay_ctrl != (FINE_DELAY_LEVELS-1))
					fine_data_delay_ctrl++;

				CTRL_TYPE =FINE_CTRL;
	//			adjust_delay();

			}

		if(uartBuffer[0] == 0x61)
		{//a
			if(fine_data_delay_ctrl != 0)
				fine_data_delay_ctrl--;

			CTRL_TYPE =FINE_CTRL;
	//		adjust_delay();

		}


		coarse_clk_delay_val =  coarse_clk_delay_ctrl;//(1<< coarse_clk_delay_ctrl) -1;
		coarse_data_delay_val =  coarse_data_delay_ctrl;//(1<< coarse_data_delay_ctrl) -1;

		adjust_delay();

		if(CTRL_TYPE == COARSE_CTRL)
		{
		test = 33 + coarse_clk_delay_ctrl;
		XUartPs_Send(&Uart_Ps, &test, 1)	;
		test = 10;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 13;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 33 + coarse_data_delay_ctrl;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 10;
		XUartPs_Send(&Uart_Ps, &test, 1);
		test = 13;
		XUartPs_Send(&Uart_Ps, &test, 1);
		//XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);
		}
		else
		{
			test = 33 + fine_clk_delay_ctrl;
			XUartPs_Send(&Uart_Ps, &test, 1)	;
			test = 10;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 13;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 33 + fine_data_delay_ctrl;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 10;
			XUartPs_Send(&Uart_Ps, &test, 1);
			test = 13;
			XUartPs_Send(&Uart_Ps, &test, 1);
					//XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);

		}



	}


	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR);
}

