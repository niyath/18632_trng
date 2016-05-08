#unplace in the cells


#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y101]]
#}

#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y102]]
#}

## place the buffer first ##


#place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/i_0 SLICE_X39Y101/B6LUT
#place_cell metastable_ro_i/delay_top_0/inst/LUT1_input_buf_anchor SLICE_X39Y101/C6LUT

#Coarse clk delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[95].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[91].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[87].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[83].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[79].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[75].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[71].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[67].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[94].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[90].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[86].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[82].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[78].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[74].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[70].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[66].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/B6LUT



place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[93].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[89].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[85].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[81].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[77].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[73].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[69].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[65].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[92].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[88].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[84].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[80].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[76].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[72].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[68].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[64].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/D6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[95].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[91].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[87].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[83].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[79].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[75].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[71].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[67].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[94].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[90].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[86].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[82].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[78].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[74].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[70].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[66].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[93].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[89].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[85].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[81].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[77].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[73].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[69].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[65].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[92].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[88].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[84].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[80].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[76].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[72].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[68].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[64].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/D6LUT
