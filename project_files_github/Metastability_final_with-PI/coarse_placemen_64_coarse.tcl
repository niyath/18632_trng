#unplace in the cells


#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y101]]
#}

#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y102]]
#}

## place the buffer first ##


place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/i_0 SLICE_X39Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/LUT1_input_buf_anchor SLICE_X39Y101/C6LUT

#Coarse clk delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[63].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[59].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[55].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[51].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[47].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[43].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[39].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[35].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[62].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[58].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[54].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[50].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[46].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[42].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[38].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[34].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[61].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[57].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[53].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[49].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[45].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[41].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[37].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[33].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[60].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[56].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[52].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[48].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[44].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[40].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[36].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[32].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/D6LUT


#Coarse data delay placement
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[63].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[59].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[55].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[51].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[47].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[43].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[39].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[35].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[62].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[58].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[54].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[50].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[46].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[42].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[38].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[34].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[61].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[57].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[53].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[49].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[45].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[41].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[37].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[33].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[60].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[56].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[52].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[48].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[44].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[40].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[36].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[32].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/D6LUT



