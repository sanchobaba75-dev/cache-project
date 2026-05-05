#/**************************************************/
#/* Compile Script for Synopsys                    */
#/*                                                */
#/* dc_shell-t -f compile_dc.tcl                   */
#/*                                                */
#/* OSU FreePDK 45nm                               */
#/**************************************************/

#/* All VHDL files, separated by spaces            */
set my_vhdl_files [list                                 \
                                   VHDLsrc/riscv_pkg.vhd \
                                   VHDLsrc/ALU.vhd \
                                   VHDLsrc/shifter.vhd \
                                   VHDLsrc/immediate_generator.vhd \
                                   VHDLsrc/riscv_regfile.vhd \
                                   VHDLsrc/riscv_core_entity.vhd \
                                    VHDLsrc/riscv_core_architecture.vhd \
                       ]

#/* Top-level Module                               */
set my_toplevel riscv_core

#/* Architecture name */
set this_arch "rtl"

#/* The name of the clock pin. If no clock-pin     */
#/* exists, pick anything                          */
set my_clock_pin clk

#/* Target frequency in MHz for optimization       */
set my_clk_freq_MHz 1000

#/* Delay of input signals (Clock-to-Q, Package etc.)  */
set my_input_delay_ns 0.1

#/* Reserved time for output signals (Holdtime etc.)   */
set my_output_delay_ns 0.1


#/**************************************************/
#/* No modifications needed below                  */
#/**************************************************/
set FREEPDK [format "%s%s"  [getenv "OSU_PATH"] "/osu_soc/lib/files"]
set search_path [concat  $search_path $FREEPDK]
set alib_library_analysis_path $FREEPDK

set link_library [set target_library [concat  [list gscl45nm.db] [list dw_foundation.sldb]]]
set target_library "gscl45nm.db"
define_design_lib WORK -path ./WORK
set verilogout_show_unconnected_pins "true"
echo $my_vhdl_files
analyze -f vhdl $my_vhdl_files

elaborate $my_toplevel

current_design $my_toplevel

link
uniquify

set my_period [expr 1000 / $my_clk_freq_MHz]

set find_clock [ find port [list $my_clock_pin] ]
if {  $find_clock != [list] } {
   set clk_name $my_clock_pin
   create_clock -period $my_period $clk_name
} else {
   set clk_name vclk
   create_clock -period $my_period -name $clk_name
}

set_driving_cell  -lib_cell INVX1  [all_inputs]
set_input_delay $my_input_delay_ns -clock $clk_name [remove_from_collection [all_inputs] $my_clock_pin]
set_output_delay $my_output_delay_ns -clock $clk_name [all_outputs]

compile -ungroup_all -map_effort medium

compile -incremental_mapping -map_effort medium

check_design
report_constraint -all_violators

set filename [format "%s_%s%s"  $my_toplevel $this_arch ".vh"]
write -f vhdl -output $filename

set filename [format "%s_%s%s"  $my_toplevel $this_arch ".sdc"]
write_sdc $filename

set filename [format "%s_%s%s"  $my_toplevel $this_arch ".db"]
write -f ddc -hier -output $filename

redirect timing.rep { report_timing }
redirect cell.rep { report_cell }
redirect power.rep { report_power }

set filename [format "%s_%s%s" $my_toplevel $this_arch "_timing.rep"]
redirect $filename { report_timing }
set filename [format "%s_%s%s" $my_toplevel $this_arch "_cell.rep"]
redirect $filename { report_cell [get_cells * -hierarchical] }
set filename [format "%s_%s%s" $my_toplevel $this_arch "_cell_ref.rep"]
redirect $filename { report_reference -hierarchy }
set filename [format "%s_%s%s" $my_toplevel $this_arch "_power.rep"]
redirect $filename { report_power }

#quit
