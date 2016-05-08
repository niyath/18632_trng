#unplace in the cells


for {set i 0} {$i<32} {incr i} {
unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y101]]
}

for {set i 0} {$i<32} {incr i} {
unplace_cell [get_cells -of [get_sites SLICE_X[expr 40 + $i]Y102]]
}

#Coarse clk delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[31].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[27].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[23].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[19].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[15].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[11].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[7].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[3].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[30].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[26].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[22].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[18].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[14].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[10].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[6].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[2].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[29].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[25].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[21].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[17].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[13].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[9].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[5].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[1].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[28].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X40Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[24].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X41Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[20].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X42Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[16].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X43Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[12].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X44Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[8].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X45Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[4].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X46Y101/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk2[0].lut_coarse_delay_inst_clk/LUT6_inst SLICE_X47Y101/D6LUT


#Coarse data delay placement

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[31].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[27].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[23].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[19].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[15].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[11].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[7].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/A6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[3].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/A6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[30].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[26].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[22].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[18].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[14].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[10].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[6].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/B6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[2].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/B6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[29].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[25].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[21].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[17].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[13].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[9].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[5].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/C6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[1].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/C6LUT

place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[28].lut_coarse_delay_inst_data/LUT6_inst SLICE_X40Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[24].lut_coarse_delay_inst_data/LUT6_inst SLICE_X41Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[20].lut_coarse_delay_inst_data/LUT6_inst SLICE_X42Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[16].lut_coarse_delay_inst_data/LUT6_inst SLICE_X43Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[12].lut_coarse_delay_inst_data/LUT6_inst SLICE_X44Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[8].lut_coarse_delay_inst_data/LUT6_inst SLICE_X45Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[4].lut_coarse_delay_inst_data/LUT6_inst SLICE_X46Y102/D6LUT
place_cell metastable_ro_i/delay_top_0/inst/coarse_delay_inst/genblk1[0].lut_coarse_delay_inst_data/LUT6_inst SLICE_X47Y102/D6LUT

