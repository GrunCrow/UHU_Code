
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name P6 -dir "C:/Users/afmhu/P6/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "P6.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {P6.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top P6 $srcset
add_files [list {P6.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
