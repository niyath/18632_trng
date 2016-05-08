#unplace in the cells


#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y105]]
#}

#for {set i 0} {$i<32} {incr i} {
#unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y106]]
#}

place_cell metastable_ro_i/delay_top_0/inst/registered_out_reg SLICE_X48Y106/BFF
place_cell metastable_ro_i/delay_top_0/inst/registered_negedge_out_reg SLICE_X49Y106/BFF
#Coarse clk delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[31].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[27].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[23].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[19].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[15].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[11].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[7].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y105/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[3].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y105/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[30].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[26].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[22].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[18].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[14].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[10].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[6].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y105/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[2].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y105/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[29].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[25].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[21].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[17].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[13].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[9].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[5].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y105/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[1].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y105/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[28].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[24].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[20].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[16].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[12].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[8].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[4].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y105/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[0].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y105/D6LUT


#Coarse data delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[31].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[27].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[23].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[19].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[15].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[11].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[7].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y106/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[3].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y106/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[30].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[26].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[22].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[18].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[14].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[10].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[6].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y106/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[2].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y106/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[29].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[25].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[21].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[17].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[13].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[9].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[5].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y106/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[1].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y106/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[28].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[24].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[20].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[16].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[12].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[8].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[4].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y106/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[0].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y106/D6LUT


