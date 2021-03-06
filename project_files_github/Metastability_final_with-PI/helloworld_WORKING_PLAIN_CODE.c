////#include <stdio.h>
//#include <assert.h>
//#include <math.h>
//#include <string.h>
//#include <stdio.h>
//#include <stdlib.h>
//#include <time.h>
//#include <limits.h>
//#include "uartControl.h"
//
//#ifdef __linux__
//
//#include <sys/mman.h>
//#include <unistd.h>
//#include <fcntl.h>
//#include <stdint.h>
//#define u16 uint16_t
//
//#else
//
//#include "platform.h"
//#include <xbasic_types.h>
//#include "xparameters.h"
//
//#endif#define FEET_WIDTH 32
//#define FEET_LENGTH 256
//#define INCHES_PER_FOOT 12
//#define RES_PER_INCH 2
//#define ROAD_WIDTH (FEET_WIDTH*INCHES_PER_FOOT*RES_PER_INCH)
//#define ROAD_LENGTH (FEET_LENGTH*INCHES_PER_FOOT*RES_PER_INCH)
//#define ROAD_BUFFER_SIZE_BYTES ((ROAD_WIDTH*ROAD_LENGTH/8))
//#define ROAD_VERT_POS (ROAD_LENGTH/2)
//
//#define WORD_WIDTH 16
//#define NUM_TRIES 3
//#define WIDTH 1024
//#define HEIGHT 384
//
//#define CLOCKS_PER_SEC_ADJ (CLOCKS_PER_SEC*13333) //seem to be 10000 times as many
//
//// Divide by 16 because there are 16 pixels to a word
//// Multiply by 2 because our bram data width is 32, but we use 16
//// So this is size in bytes
//#define BUF_SIZE_BYTES ((WIDTH * HEIGHT / 8))
//#define BRAM_BASEADDR0 0x40000000
//#define BRAM_BASEADDR1 0x42000000
//
//#define NUM_REC_FRAMES 1200
// u8 uartBuffer_2[3];
//int main()
//{
//	xil_printf("helloworld\n");
//    init_platform();
//
//   // Status = XGpio_Initialize(&Gpio, XPAR_AXI_GPIO_0_DEVICE_ID);
//  //	if (Status != XST_SUCCESS) {
//  //		return XST_FAILURE;
//  //	}
//
//  	/*
//  	 * Perform a self-test on the GPIO.  This is a minimal test and only
//  	 * verifies that there is not any bus error when reading the data
//  	 * register
//  	 */
//  //	XGpio_SelfTest(&Gpio);
//
//  	/*
//  	 * Setup direction register so the switch is an input and the LED is
//  	 * an output of the GPIO
//  	 */
//  //	XGpio_SetDataDirection(&Gpio, BRAM_FULL_CHANNEL, 0xFFFF);
//
//
//    gpioBrightAddr = GPIO_BRIGHT_BASEADDR;
//    gpioThreshAddr = GPIO_THRESH_BASEADDR;
// int lol;
//    setupUartControl();
//	xil_printf("in while loop\n");
//    int ReceivedCount;
//    char somma;
//      while (1) {
//    	//  ReceivedCount =	XUartPs_Recv(&Uart_Ps, uartBuffer_2,3);
//    	 //  XUartPs_Recv(&Uart_Ps, uartBuffer_2, 3);
//    	  // xil_printf("atleast printign \n");
//    	//  memset(0x41220000,16,1);
//    	   if(ReceivedCount!=0 || check !=0)
//    	   {
//    		   lol =1;
//    		   //xil_printf("respinding to dat\n");
//    	   }
//        }
//
//    cleanup_platform();
//    return 0;
//}
//
//
//
//
//


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

#define TEST_BUFFER_SIZE 3
#define GPIO_ADDR XPAR_AXI_GPIO_0_BASEADDR
#define INTC_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID
#define UART_INT_IRQ_ID	XPAR_XUARTPS_1_INTR

static int SetupInterruptSystem(XScuGic *IntcInstancePtr,
				XUartPs *UartInstancePtr,
				u16 UartIntrId);

void Handler(void *CallBackRef, u32 Event, unsigned int EventData);

XUartPs Uart_Ps;		/* The instance of the UART Driver */
XScuGic InterruptController;	/* Instance of the Interrupt Controller */
XUartPs_Config *Config;
u8 testval = 5;
u8 recvTout = 0;

static u8 RecvBuffer[TEST_BUFFER_SIZE];	/* Buffer for Receiving Data */

//void print(char *str);

int main()
{
    init_platform();
    int Status;
    u32 IntrMask;

    Config = XUartPs_LookupConfig(0);
    if (NULL == Config) {
    	return XST_FAILURE;
    }

    Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
    	return XST_FAILURE;
    }

    XUartPs_SetBaudRate(&Uart_Ps, 115200);

    /*
   	 * Check hardware build.
   	 */
   	Status = XUartPs_SelfTest(&Uart_Ps);
   	if (Status != XST_SUCCESS) {
   		return XST_FAILURE;
   	}

   	/*
   	 * Connect the UART to the interrupt subsystem such that interrupts
   	 * can occur. This function is application specific.
   	 */
   	Status = SetupInterruptSystem(&InterruptController, &Uart_Ps, UART_INT_IRQ_ID);
   	if (Status != XST_SUCCESS) {
   		return XST_FAILURE;
   	}

   	/*
   	 * Setup the handlers for the UART that will be called from the
   	 * interrupt context when data has been sent and received, specify
   	 * a pointer to the UART driver instance as the callback reference
   	 * so the handlers are able to access the instance data
   	 */
   	XUartPs_SetHandler(&Uart_Ps, (XUartPs_Handler)Handler, &Uart_Ps);

   	/*
   	 * Enable the interrupt of the UART so interrupts will occur
   	 */
   	IntrMask =
   		XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
   		XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
   		XUARTPS_IXR_RXOVR;
   	XUartPs_SetInterruptMask(&Uart_Ps, IntrMask);

   	/*
   	 * Set the receiver timeout. If it is not set, and the last few bytes
   	 * of data do not trigger the over-water or full interrupt, the bytes
   	 * will not be received. By default it is disabled.
   	 *
   	 * The setting of 8 will timeout after 8 x 4 = 32 character times.
   	 * Increase the time out value if baud rate is high, decrease it if
   	 * baud rate is low.
   	 */
   	XUartPs_SetRecvTimeout(&Uart_Ps, 255);

   	while(1);
   	/*
   	 * Use local loopback mode.
   	 */
   	//UartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_LOCAL_LOOP);
   	/*u8 testval = 5;
   	while(1){
   		u8 numReceived = 0;
   		numReceived =
   				XUartPs_Recv(&Uart_Ps, RecvBuffer, TEST_BUFFER_SIZE);
   		//memcpy((u8*)GPIO_ADDR, &testval,1);
   		if(numReceived == 0)
   			continue;
   			//XUartPs_Send(&Uart_Ps, &RecvBuffer[ReceivedCount],
   			//		numReceived);
			//memcpy((u8*)GPIO_ADDR, &ReceivedCount,1);
   		if(RecvBuffer[0] == 0x41){
   			testval++;
   		}else if(RecvBuffer[0] == 0x42){
   			testval--;
   		}
   		memcpy((u8*)GPIO_ADDR, &testval,1);
   			//Up Arrow: 1B 5B 41
   			//Down Arrow: 1B 5B 42
   			//Left Arrow: 1B 5B 44
   			//Right Arrow: 1B 5B 43
   		//printf("Received Byte\n");
   		//printf("%i",RecvBuffer[0]);

   	}
	*/
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
void Handler(void *CallBackRef, u32 Event, unsigned int EventData)
{
	/*
	 * All of the data has been sent
	 */
	if (Event == XUARTPS_EVENT_SENT_DATA);

	/*
	 * All of the data has been received
	 */
	if (Event == XUARTPS_EVENT_RECV_DATA) {
		XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);
		XUartPs_Recv(&Uart_Ps, RecvBuffer, TEST_BUFFER_SIZE);
		//XUartPs_Send(&Uart_Ps, RecvBuffer, TEST_BUFFER_SIZE);
		if(RecvBuffer[2] == 0x41){
			testval++;
		}else if(RecvBuffer[2] == 0x42){
			testval--;
		}
		memcpy((u8*)0x41220000, &testval,1);
		//Up Arrow: 1B 5B 41
		//Down Arrow: 1B 5B 42
		//Left Arrow: 1B 5B 44
		//Right Arrow: 1B 5B 43
	}

	/*
	 * Data was received, but not the expected number of bytes, a
	 * timeout just indicates the data stopped for 8 character times
	 */
	if (Event == XUARTPS_EVENT_RECV_TOUT){
		XUartPs_Send(&Uart_Ps, RecvBuffer, EventData);
		XUartPs_Recv(&Uart_Ps, RecvBuffer, TEST_BUFFER_SIZE);
		recvTout++;
		memcpy((u8*)0x41220000, &recvTout,1);
	}


	/*
	 * Data was received with an error, keep the data but determine
	 * what kind of errors occurred
	 */
	if (Event == XUARTPS_EVENT_RECV_ERROR);
}
