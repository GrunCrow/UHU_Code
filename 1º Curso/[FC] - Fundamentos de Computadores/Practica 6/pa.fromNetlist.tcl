
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P6 -dir "C:/Users/afmhu/P6/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/afmhu/P6/P6.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/afmhu/P6} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "P6.ucf" [current_fileset -constrset]
add_files [list {P6.ucf}] -fileset [get_property constrset [current_run]]
link_design
