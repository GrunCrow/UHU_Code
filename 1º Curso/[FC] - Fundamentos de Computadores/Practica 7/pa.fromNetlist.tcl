
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name P7 -dir "C:/Users/afmhu/P7/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/afmhu/P7/P7_COMPLETA.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/afmhu/P7} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "restricciones_antirrebotes.ucf" [current_fileset -constrset]
add_files [list {restricciones_antirrebotes.ucf}] -fileset [get_property constrset [current_run]]
link_design
