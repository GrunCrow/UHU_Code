////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: P6_timesim.v
// /___/   /\     Timestamp: Wed Dec 18 09:47:31 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf P6.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim P6.ncd P6_timesim.v 
// Device	: 3s500efg320-4 (PRODUCTION 1.27 2013-10-13)
// Input file	: P6.ncd
// Output file	: C:\Users\afmhu\P6\netgen\par\P6_timesim.v
// # of Modules	: 1
// Design Name	: P6
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module P6 (
  Ci, F, A, B, S
);
  input Ci;
  output [4 : 0] F;
  input [3 : 0] A;
  input [3 : 0] B;
  input [2 : 0] S;
  wire Ci_IBUF_245;
  wire A_0_IBUF_246;
  wire B_0_IBUF_247;
  wire A_1_IBUF_248;
  wire B_1_IBUF_249;
  wire A_2_IBUF_253;
  wire B_2_IBUF_254;
  wire A_3_IBUF_255;
  wire B_3_IBUF_256;
  wire S_1_IBUF_260;
  wire S_2_IBUF_261;
  wire S_0_IBUF_262;
  wire Mmux_F_3_f5;
  wire Mmux_F_4_f5;
  wire Mmux_F_3_f51;
  wire Mmux_F_4_f51;
  wire N6_0;
  wire Mmux_F_3_f52;
  wire Mmux_F_4_f52;
  wire N2_0;
  wire \F_addsub0002<2>_0 ;
  wire Mmux_F_3_f53;
  wire Mmux_F_4_f53;
  wire \F_addsub0003<3>_0 ;
  wire \F_addsub0004<3>_0 ;
  wire N4_0;
  wire N01;
  wire \F_addsub0002[4] ;
  wire \Madd_F_addsub0003_cy<3>_0 ;
  wire \F_addsub0004<4>_0 ;
  wire Mmux_F_5_f5;
  wire N8;
  wire \Madd_F_addsub0003_cy[0] ;
  wire \F_addsub0001<0>/XORF_323 ;
  wire \F_addsub0001<0>/CYINIT_322 ;
  wire \F_addsub0001<0>/CY0F_321 ;
  wire \F_addsub0001<0>/CYSELF_313 ;
  wire \Madd_F_addsub0001_Madd_lut<0>1_312 ;
  wire \F_addsub0001<0>/XORG_309 ;
  wire \F_addsub0001<0>/CYMUXG_308 ;
  wire \F_addsub0001<0>/CY0G_306 ;
  wire \F_addsub0001<0>/CYSELG_298 ;
  wire \F_addsub0001<2>/XORF_362 ;
  wire \F_addsub0001<2>/CYINIT_361 ;
  wire \F_addsub0001<2>/CY0F_360 ;
  wire \F_addsub0001<2>/XORG_350 ;
  wire \F_addsub0001<2>/CYSELF_348 ;
  wire \F_addsub0001<2>/CYMUXFAST_347 ;
  wire \F_addsub0001<2>/CYAND_346 ;
  wire \F_addsub0001<2>/FASTCARRY_345 ;
  wire \F_addsub0001<2>/CYMUXG2_344 ;
  wire \F_addsub0001<2>/CYMUXF2_343 ;
  wire \F_addsub0001<2>/CY0G_342 ;
  wire \F_addsub0001<2>/CYSELG_334 ;
  wire \F_0_OBUF/F5MUX_394 ;
  wire \F_0_OBUF/BXINV_384 ;
  wire \F_0_OBUF/F6MUX_382 ;
  wire Mmux_F_5_380;
  wire \F_0_OBUF/BYINV_374 ;
  wire \F_1_OBUF/F5MUX_449 ;
  wire Mmux_F_4_447;
  wire \F_1_OBUF/BXINV_440 ;
  wire \F_1_OBUF/F6MUX_438 ;
  wire Mmux_F_52_436;
  wire \F_1_OBUF/BYINV_430 ;
  wire \Mmux_F_4_f51/F5MUX_473 ;
  wire Mmux_F_53_471;
  wire \Mmux_F_4_f51/BXINV_466 ;
  wire Mmux_F_61_464;
  wire \F_3_OBUF/F5MUX_559 ;
  wire Mmux_F_42_557;
  wire \F_3_OBUF/BXINV_550 ;
  wire \F_3_OBUF/F6MUX_548 ;
  wire Mmux_F_56_546;
  wire \F_3_OBUF/BYINV_540 ;
  wire \F_2_OBUF/F5MUX_504 ;
  wire Mmux_F_41_502;
  wire \F_2_OBUF/BXINV_495 ;
  wire \F_2_OBUF/F6MUX_493 ;
  wire Mmux_F_54_491;
  wire \F_2_OBUF/BYINV_485 ;
  wire \Mmux_F_4_f5/F5MUX_418 ;
  wire Mmux_F_51_416;
  wire \Mmux_F_4_f5/BXINV_410 ;
  wire Mmux_F_6_408;
  wire \Mmux_F_4_f52/F5MUX_528 ;
  wire Mmux_F_55_526;
  wire \Mmux_F_4_f52/BXINV_519 ;
  wire Mmux_F_62_517;
  wire \A<1>/INBUF ;
  wire \B<0>/INBUF ;
  wire \B<1>/INBUF ;
  wire \B<3>/INBUF ;
  wire \Mmux_F_4_f53/F5MUX_583 ;
  wire Mmux_F_57_581;
  wire \Mmux_F_4_f53/BXINV_575 ;
  wire Mmux_F_63_573;
  wire \A<2>/INBUF ;
  wire \B<2>/INBUF ;
  wire \Ci/INBUF ;
  wire \A<0>/INBUF ;
  wire \A<3>/INBUF ;
  wire \F<1>/O ;
  wire \S<2>/INBUF ;
  wire \F<4>/O ;
  wire \Mmux_F_5_f5/F5MUX_744 ;
  wire Mmux_F_64_742;
  wire \Mmux_F_5_f5/BXINV_736 ;
  wire Mmux_F_7_734;
  wire \S<0>/INBUF ;
  wire \F<2>/O ;
  wire \S<1>/INBUF ;
  wire \F_addsub0002<4>/F5MUX_719 ;
  wire \Msub_F_addsub0002_xor<4>11 ;
  wire \F_addsub0002<4>/BXINV_712 ;
  wire \Msub_F_addsub0002_xor<4>111_710 ;
  wire N2;
  wire N6;
  wire \F<0>/O ;
  wire \F<3>/O ;
  wire F_4_OBUF_875;
  wire \Madd_F_addsub0003_cy[3] ;
  wire N4;
  wire N01_pack_1;
  wire \F_addsub0002[2] ;
  wire N8_pack_1;
  wire \Madd_F_addsub0003_cy<0>_pack_1 ;
  wire VCC;
  wire [3 : 0] F_addsub0001;
  wire [3 : 0] Madd_F_addsub0001_Madd_cy;
  wire [3 : 1] Madd_F_addsub0001_Madd_lut;
  wire [0 : 0] F_not0000;
  wire [4 : 3] F_addsub0004;
  wire [3 : 3] F_addsub0003;
  initial $sdf_annotate("netgen/par/p6_timesim.sdf");
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/XUSED  (
    .I(\F_addsub0001<0>/XORF_323 ),
    .O(F_addsub0001[0])
  );
  X_XOR2 #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/XORF  (
    .I0(\F_addsub0001<0>/CYINIT_322 ),
    .I1(\Madd_F_addsub0001_Madd_lut<0>1_312 ),
    .O(\F_addsub0001<0>/XORF_323 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CYMUXF  (
    .IA(\F_addsub0001<0>/CY0F_321 ),
    .IB(\F_addsub0001<0>/CYINIT_322 ),
    .SEL(\F_addsub0001<0>/CYSELF_313 ),
    .O(Madd_F_addsub0001_Madd_cy[0])
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CYINIT  (
    .I(Ci_IBUF_245),
    .O(\F_addsub0001<0>/CYINIT_322 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CY0F  (
    .I(A_0_IBUF_246),
    .O(\F_addsub0001<0>/CY0F_321 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CYSELF  (
    .I(\Madd_F_addsub0001_Madd_lut<0>1_312 ),
    .O(\F_addsub0001<0>/CYSELF_313 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/YUSED  (
    .I(\F_addsub0001<0>/XORG_309 ),
    .O(F_addsub0001[1])
  );
  X_XOR2 #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/XORG  (
    .I0(Madd_F_addsub0001_Madd_cy[0]),
    .I1(Madd_F_addsub0001_Madd_lut[1]),
    .O(\F_addsub0001<0>/XORG_309 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/COUTUSED  (
    .I(\F_addsub0001<0>/CYMUXG_308 ),
    .O(Madd_F_addsub0001_Madd_cy[1])
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CYMUXG  (
    .IA(\F_addsub0001<0>/CY0G_306 ),
    .IB(Madd_F_addsub0001_Madd_cy[0]),
    .SEL(\F_addsub0001<0>/CYSELG_298 ),
    .O(\F_addsub0001<0>/CYMUXG_308 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CY0G  (
    .I(A_1_IBUF_248),
    .O(\F_addsub0001<0>/CY0G_306 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y88" ))
  \F_addsub0001<0>/CYSELG  (
    .I(Madd_F_addsub0001_Madd_lut[1]),
    .O(\F_addsub0001<0>/CYSELG_298 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/XUSED  (
    .I(\F_addsub0001<2>/XORF_362 ),
    .O(F_addsub0001[2])
  );
  X_XOR2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/XORF  (
    .I0(\F_addsub0001<2>/CYINIT_361 ),
    .I1(Madd_F_addsub0001_Madd_lut[2]),
    .O(\F_addsub0001<2>/XORF_362 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYMUXF  (
    .IA(\F_addsub0001<2>/CY0F_360 ),
    .IB(\F_addsub0001<2>/CYINIT_361 ),
    .SEL(\F_addsub0001<2>/CYSELF_348 ),
    .O(Madd_F_addsub0001_Madd_cy[2])
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYMUXF2  (
    .IA(\F_addsub0001<2>/CY0F_360 ),
    .IB(\F_addsub0001<2>/CY0F_360 ),
    .SEL(\F_addsub0001<2>/CYSELF_348 ),
    .O(\F_addsub0001<2>/CYMUXF2_343 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYINIT  (
    .I(Madd_F_addsub0001_Madd_cy[1]),
    .O(\F_addsub0001<2>/CYINIT_361 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CY0F  (
    .I(A_2_IBUF_253),
    .O(\F_addsub0001<2>/CY0F_360 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYSELF  (
    .I(Madd_F_addsub0001_Madd_lut[2]),
    .O(\F_addsub0001<2>/CYSELF_348 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/YUSED  (
    .I(\F_addsub0001<2>/XORG_350 ),
    .O(F_addsub0001[3])
  );
  X_XOR2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/XORG  (
    .I0(Madd_F_addsub0001_Madd_cy[2]),
    .I1(Madd_F_addsub0001_Madd_lut[3]),
    .O(\F_addsub0001<2>/XORG_350 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/COUTUSED  (
    .I(\F_addsub0001<2>/CYMUXFAST_347 ),
    .O(Madd_F_addsub0001_Madd_cy[3])
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/FASTCARRY  (
    .I(Madd_F_addsub0001_Madd_cy[1]),
    .O(\F_addsub0001<2>/FASTCARRY_345 )
  );
  X_AND2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYAND  (
    .I0(\F_addsub0001<2>/CYSELG_334 ),
    .I1(\F_addsub0001<2>/CYSELF_348 ),
    .O(\F_addsub0001<2>/CYAND_346 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYMUXFAST  (
    .IA(\F_addsub0001<2>/CYMUXG2_344 ),
    .IB(\F_addsub0001<2>/FASTCARRY_345 ),
    .SEL(\F_addsub0001<2>/CYAND_346 ),
    .O(\F_addsub0001<2>/CYMUXFAST_347 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYMUXG2  (
    .IA(\F_addsub0001<2>/CY0G_342 ),
    .IB(\F_addsub0001<2>/CYMUXF2_343 ),
    .SEL(\F_addsub0001<2>/CYSELG_334 ),
    .O(\F_addsub0001<2>/CYMUXG2_344 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CY0G  (
    .I(A_3_IBUF_255),
    .O(\F_addsub0001<2>/CY0G_342 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y89" ))
  \F_addsub0001<2>/CYSELG  (
    .I(Madd_F_addsub0001_Madd_lut[3]),
    .O(\F_addsub0001<2>/CYSELG_334 )
  );
  X_BUF #(
    .LOC ( "SLICE_X67Y80" ))
  \F_0_OBUF/F5USED  (
    .I(\F_0_OBUF/F5MUX_394 ),
    .O(Mmux_F_3_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X67Y80" ))
  \F_0_OBUF/F5MUX  (
    .IA(Mmux_F_5_380),
    .IB(F_not0000[0]),
    .SEL(\F_0_OBUF/BXINV_384 ),
    .O(\F_0_OBUF/F5MUX_394 )
  );
  X_BUF #(
    .LOC ( "SLICE_X67Y80" ))
  \F_0_OBUF/BXINV  (
    .I(S_1_IBUF_260),
    .O(\F_0_OBUF/BXINV_384 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X67Y80" ))
  \F_0_OBUF/F6MUX  (
    .IA(Mmux_F_4_f5),
    .IB(Mmux_F_3_f5),
    .SEL(\F_0_OBUF/BYINV_374 ),
    .O(\F_0_OBUF/F6MUX_382 )
  );
  X_BUF #(
    .LOC ( "SLICE_X67Y80" ))
  \F_0_OBUF/BYINV  (
    .I(S_2_IBUF_261),
    .O(\F_0_OBUF/BYINV_374 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y80" ))
  \F_1_OBUF/F5USED  (
    .I(\F_1_OBUF/F5MUX_449 ),
    .O(Mmux_F_3_f51)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y80" ))
  \F_1_OBUF/F5MUX  (
    .IA(Mmux_F_52_436),
    .IB(Mmux_F_4_447),
    .SEL(\F_1_OBUF/BXINV_440 ),
    .O(\F_1_OBUF/F5MUX_449 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y80" ))
  \F_1_OBUF/BXINV  (
    .I(S_1_IBUF_260),
    .O(\F_1_OBUF/BXINV_440 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y80" ))
  \F_1_OBUF/F6MUX  (
    .IA(Mmux_F_4_f51),
    .IB(Mmux_F_3_f51),
    .SEL(\F_1_OBUF/BYINV_430 ),
    .O(\F_1_OBUF/F6MUX_438 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y80" ))
  \F_1_OBUF/BYINV  (
    .I(S_2_IBUF_261),
    .O(\F_1_OBUF/BYINV_430 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y81" ))
  \Mmux_F_4_f51/F5USED  (
    .I(\Mmux_F_4_f51/F5MUX_473 ),
    .O(Mmux_F_4_f51)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y81" ))
  \Mmux_F_4_f51/F5MUX  (
    .IA(Mmux_F_61_464),
    .IB(Mmux_F_53_471),
    .SEL(\Mmux_F_4_f51/BXINV_466 ),
    .O(\Mmux_F_4_f51/F5MUX_473 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y81" ))
  \Mmux_F_4_f51/BXINV  (
    .I(S_1_IBUF_260),
    .O(\Mmux_F_4_f51/BXINV_466 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y90" ))
  \F_3_OBUF/F5USED  (
    .I(\F_3_OBUF/F5MUX_559 ),
    .O(Mmux_F_3_f53)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y90" ))
  \F_3_OBUF/F5MUX  (
    .IA(Mmux_F_56_546),
    .IB(Mmux_F_42_557),
    .SEL(\F_3_OBUF/BXINV_550 ),
    .O(\F_3_OBUF/F5MUX_559 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y90" ))
  \F_3_OBUF/BXINV  (
    .I(S_1_IBUF_260),
    .O(\F_3_OBUF/BXINV_550 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y90" ))
  \F_3_OBUF/F6MUX  (
    .IA(Mmux_F_4_f53),
    .IB(Mmux_F_3_f53),
    .SEL(\F_3_OBUF/BYINV_540 ),
    .O(\F_3_OBUF/F6MUX_548 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y90" ))
  \F_3_OBUF/BYINV  (
    .I(S_2_IBUF_261),
    .O(\F_3_OBUF/BYINV_540 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y86" ))
  \F_2_OBUF/F5USED  (
    .I(\F_2_OBUF/F5MUX_504 ),
    .O(Mmux_F_3_f52)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y86" ))
  \F_2_OBUF/F5MUX  (
    .IA(Mmux_F_54_491),
    .IB(Mmux_F_41_502),
    .SEL(\F_2_OBUF/BXINV_495 ),
    .O(\F_2_OBUF/F5MUX_504 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y86" ))
  \F_2_OBUF/BXINV  (
    .I(S_1_IBUF_260),
    .O(\F_2_OBUF/BXINV_495 )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y86" ))
  \F_2_OBUF/F6MUX  (
    .IA(Mmux_F_4_f52),
    .IB(Mmux_F_3_f52),
    .SEL(\F_2_OBUF/BYINV_485 ),
    .O(\F_2_OBUF/F6MUX_493 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y86" ))
  \F_2_OBUF/BYINV  (
    .I(S_2_IBUF_261),
    .O(\F_2_OBUF/BYINV_485 )
  );
  X_BUF #(
    .LOC ( "SLICE_X67Y81" ))
  \Mmux_F_4_f5/F5USED  (
    .I(\Mmux_F_4_f5/F5MUX_418 ),
    .O(Mmux_F_4_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X67Y81" ))
  \Mmux_F_4_f5/F5MUX  (
    .IA(Mmux_F_6_408),
    .IB(Mmux_F_51_416),
    .SEL(\Mmux_F_4_f5/BXINV_410 ),
    .O(\Mmux_F_4_f5/F5MUX_418 )
  );
  X_BUF #(
    .LOC ( "SLICE_X67Y81" ))
  \Mmux_F_4_f5/BXINV  (
    .I(S_1_IBUF_260),
    .O(\Mmux_F_4_f5/BXINV_410 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y87" ))
  \Mmux_F_4_f52/F5USED  (
    .I(\Mmux_F_4_f52/F5MUX_528 ),
    .O(Mmux_F_4_f52)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X55Y87" ))
  \Mmux_F_4_f52/F5MUX  (
    .IA(Mmux_F_62_517),
    .IB(Mmux_F_55_526),
    .SEL(\Mmux_F_4_f52/BXINV_519 ),
    .O(\Mmux_F_4_f52/F5MUX_528 )
  );
  X_BUF #(
    .LOC ( "SLICE_X55Y87" ))
  \Mmux_F_4_f52/BXINV  (
    .I(S_1_IBUF_260),
    .O(\Mmux_F_4_f52/BXINV_519 )
  );
  X_IPAD #(
    .LOC ( "PAD57" ))
  \A<1>/PAD  (
    .PAD(A[1])
  );
  X_BUF #(
    .LOC ( "PAD57" ))
  A_1_IBUF (
    .I(A[1]),
    .O(\A<1>/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD54" ))
  \B<0>/PAD  (
    .PAD(B[0])
  );
  X_BUF #(
    .LOC ( "IPAD54" ))
  B_0_IBUF (
    .I(B[0]),
    .O(\B<0>/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD55" ))
  \B<1>/PAD  (
    .PAD(B[1])
  );
  X_BUF #(
    .LOC ( "IPAD55" ))
  B_1_IBUF (
    .I(B[1]),
    .O(\B<1>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD51" ))
  \B<3>/PAD  (
    .PAD(B[3])
  );
  X_BUF #(
    .LOC ( "PAD51" ))
  B_3_IBUF (
    .I(B[3]),
    .O(\B<3>/INBUF )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y91" ))
  \Mmux_F_4_f53/F5USED  (
    .I(\Mmux_F_4_f53/F5MUX_583 ),
    .O(Mmux_F_4_f53)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X57Y91" ))
  \Mmux_F_4_f53/F5MUX  (
    .IA(Mmux_F_63_573),
    .IB(Mmux_F_57_581),
    .SEL(\Mmux_F_4_f53/BXINV_575 ),
    .O(\Mmux_F_4_f53/F5MUX_583 )
  );
  X_BUF #(
    .LOC ( "SLICE_X57Y91" ))
  \Mmux_F_4_f53/BXINV  (
    .I(S_1_IBUF_260),
    .O(\Mmux_F_4_f53/BXINV_575 )
  );
  X_IPAD #(
    .LOC ( "PAD56" ))
  \A<2>/PAD  (
    .PAD(A[2])
  );
  X_BUF #(
    .LOC ( "PAD56" ))
  A_2_IBUF (
    .I(A[2]),
    .O(\A<2>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD52" ))
  \B<2>/PAD  (
    .PAD(B[2])
  );
  X_BUF #(
    .LOC ( "PAD52" ))
  B_2_IBUF (
    .I(B[2]),
    .O(\B<2>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD50" ))
  \Ci/PAD  (
    .PAD(Ci)
  );
  X_BUF #(
    .LOC ( "PAD50" ))
  Ci_IBUF (
    .I(Ci),
    .O(\Ci/INBUF )
  );
  X_IPAD #(
    .LOC ( "IPAD58" ))
  \A<0>/PAD  (
    .PAD(A[0])
  );
  X_BUF #(
    .LOC ( "IPAD58" ))
  A_0_IBUF (
    .I(A[0]),
    .O(\A<0>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD53" ))
  \A<3>/PAD  (
    .PAD(A[3])
  );
  X_BUF #(
    .LOC ( "PAD53" ))
  A_3_IBUF (
    .I(A[3]),
    .O(\A<3>/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD38" ))
  \F<1>/PAD  (
    .PAD(F[1])
  );
  X_OBUF #(
    .LOC ( "PAD38" ))
  F_1_OBUF (
    .I(\F<1>/O ),
    .O(F[1])
  );
  X_IPAD #(
    .LOC ( "IPAD108" ))
  \S<2>/PAD  (
    .PAD(S[2])
  );
  X_BUF #(
    .LOC ( "IPAD108" ))
  S_2_IBUF (
    .I(S[2]),
    .O(\S<2>/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD23" ))
  \F<4>/PAD  (
    .PAD(F[4])
  );
  X_OBUF #(
    .LOC ( "PAD23" ))
  F_4_OBUF (
    .I(\F<4>/O ),
    .O(F[4])
  );
  X_BUF #(
    .LOC ( "SLICE_X58Y89" ))
  \Mmux_F_5_f5/XUSED  (
    .I(\Mmux_F_5_f5/F5MUX_744 ),
    .O(Mmux_F_5_f5)
  );
  X_MUX2 #(
    .LOC ( "SLICE_X58Y89" ))
  \Mmux_F_5_f5/F5MUX  (
    .IA(Mmux_F_7_734),
    .IB(Mmux_F_64_742),
    .SEL(\Mmux_F_5_f5/BXINV_736 ),
    .O(\Mmux_F_5_f5/F5MUX_744 )
  );
  X_BUF #(
    .LOC ( "SLICE_X58Y89" ))
  \Mmux_F_5_f5/BXINV  (
    .I(S_1_IBUF_260),
    .O(\Mmux_F_5_f5/BXINV_736 )
  );
  X_IPAD #(
    .LOC ( "IPAD103" ))
  \S<0>/PAD  (
    .PAD(S[0])
  );
  X_BUF #(
    .LOC ( "IPAD103" ))
  S_0_IBUF (
    .I(S[0]),
    .O(\S<0>/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD37" ))
  \F<2>/PAD  (
    .PAD(F[2])
  );
  X_OBUF #(
    .LOC ( "PAD37" ))
  F_2_OBUF (
    .I(\F<2>/O ),
    .O(F[2])
  );
  X_IPAD #(
    .LOC ( "IPAD83" ))
  \S<1>/PAD  (
    .PAD(S[1])
  );
  X_BUF #(
    .LOC ( "IPAD83" ))
  S_1_IBUF (
    .I(S[1]),
    .O(\S<1>/INBUF )
  );
  X_BUF #(
    .LOC ( "SLICE_X59Y91" ))
  \F_addsub0002<4>/XUSED  (
    .I(\F_addsub0002<4>/F5MUX_719 ),
    .O(\F_addsub0002[4] )
  );
  X_MUX2 #(
    .LOC ( "SLICE_X59Y91" ))
  \F_addsub0002<4>/F5MUX  (
    .IA(\Msub_F_addsub0002_xor<4>111_710 ),
    .IB(\Msub_F_addsub0002_xor<4>11 ),
    .SEL(\F_addsub0002<4>/BXINV_712 ),
    .O(\F_addsub0002<4>/F5MUX_719 )
  );
  X_BUF #(
    .LOC ( "SLICE_X59Y91" ))
  \F_addsub0002<4>/BXINV  (
    .I(N01),
    .O(\F_addsub0002<4>/BXINV_712 )
  );
  X_BUF #(
    .LOC ( "SLICE_X65Y81" ))
  \N2/XUSED  (
    .I(N2),
    .O(N2_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X65Y81" ))
  \N2/YUSED  (
    .I(N6),
    .O(N6_0)
  );
  X_OPAD #(
    .LOC ( "PAD40" ))
  \F<0>/PAD  (
    .PAD(F[0])
  );
  X_OBUF #(
    .LOC ( "PAD40" ))
  F_0_OBUF (
    .I(\F<0>/O ),
    .O(F[0])
  );
  X_OPAD #(
    .LOC ( "PAD24" ))
  \F<3>/PAD  (
    .PAD(F[3])
  );
  X_OBUF #(
    .LOC ( "PAD24" ))
  F_3_OBUF (
    .I(\F<3>/O ),
    .O(F[3])
  );
  X_BUF #(
    .LOC ( "SLICE_X65Y89" ))
  \F_addsub0004<4>/XUSED  (
    .I(F_addsub0004[4]),
    .O(\F_addsub0004<4>_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X65Y89" ))
  \F_addsub0004<4>/YUSED  (
    .I(F_addsub0004[3]),
    .O(\F_addsub0004<3>_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X58Y88" ))
  \Madd_F_addsub0003_cy<3>/XUSED  (
    .I(\Madd_F_addsub0003_cy[3] ),
    .O(\Madd_F_addsub0003_cy<3>_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X58Y91" ))
  \N4/XUSED  (
    .I(N4),
    .O(N4_0)
  );
  X_BUF #(
    .LOC ( "SLICE_X58Y91" ))
  \N4/YUSED  (
    .I(N01_pack_1),
    .O(N01)
  );
  X_BUF #(
    .LOC ( "SLICE_X63Y91" ))
  \F_addsub0002<2>/XUSED  (
    .I(\F_addsub0002[2] ),
    .O(\F_addsub0002<2>_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X63Y91" ))
  \F_addsub0002<2>/YUSED  (
    .I(N8_pack_1),
    .O(N8)
  );
  X_BUF #(
    .LOC ( "SLICE_X56Y90" ))
  \F_addsub0003<3>/XUSED  (
    .I(F_addsub0003[3]),
    .O(\F_addsub0003<3>_0 )
  );
  X_BUF #(
    .LOC ( "SLICE_X56Y90" ))
  \F_addsub0003<3>/YUSED  (
    .I(\Madd_F_addsub0003_cy<0>_pack_1 ),
    .O(\Madd_F_addsub0003_cy[0] )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ),
    .LOC ( "SLICE_X65Y89" ))
  \Msub_F_addsub0004_xor<4>11  (
    .ADR0(A_3_IBUF_255),
    .ADR1(A_1_IBUF_248),
    .ADR2(A_2_IBUF_253),
    .ADR3(A_0_IBUF_246),
    .O(F_addsub0004[4])
  );
  X_LUT4 #(
    .INIT ( 16'h6CCC ),
    .LOC ( "SLICE_X56Y90" ))
  \Madd_F_addsub0003_xor<3>11  (
    .ADR0(A_1_IBUF_248),
    .ADR1(A_3_IBUF_255),
    .ADR2(A_2_IBUF_253),
    .ADR3(\Madd_F_addsub0003_cy[0] ),
    .O(F_addsub0003[3])
  );
  X_LUT4 #(
    .INIT ( 16'h22B2 ),
    .LOC ( "SLICE_X63Y91" ))
  \Msub_F_addsub0002_xor<2>11_SW0  (
    .ADR0(B_1_IBUF_249),
    .ADR1(A_1_IBUF_248),
    .ADR2(B_0_IBUF_247),
    .ADR3(A_0_IBUF_246),
    .O(N8_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hFFAA ),
    .LOC ( "SLICE_X56Y90" ))
  \Madd_F_addsub0003_cy<0>11  (
    .ADR0(A_0_IBUF_246),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(Ci_IBUF_245),
    .O(\Madd_F_addsub0003_cy<0>_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h8000 ),
    .LOC ( "SLICE_X58Y88" ))
  \Madd_F_addsub0003_cy<3>11  (
    .ADR0(A_2_IBUF_253),
    .ADR1(A_1_IBUF_248),
    .ADR2(\Madd_F_addsub0003_cy[0] ),
    .ADR3(A_3_IBUF_255),
    .O(\Madd_F_addsub0003_cy[3] )
  );
  X_LUT4 #(
    .INIT ( 16'hF0AA ),
    .LOC ( "SLICE_X58Y89" ))
  Mmux_F_64 (
    .ADR0(\Madd_F_addsub0003_cy<3>_0 ),
    .ADR1(VCC),
    .ADR2(\F_addsub0004<4>_0 ),
    .ADR3(S_0_IBUF_262),
    .O(Mmux_F_64_742)
  );
  X_LUT4 #(
    .INIT ( 16'hC6C6 ),
    .LOC ( "SLICE_X65Y81" ))
  Mmux_F_61_SW0 (
    .ADR0(B_0_IBUF_247),
    .ADR1(B_1_IBUF_249),
    .ADR2(A_0_IBUF_246),
    .ADR3(VCC),
    .O(N6)
  );
  X_LUT4 #(
    .INIT ( 16'hC663 ),
    .LOC ( "SLICE_X58Y91" ))
  Mmux_F_63_SW0 (
    .ADR0(B_2_IBUF_254),
    .ADR1(B_3_IBUF_256),
    .ADR2(N01),
    .ADR3(A_2_IBUF_253),
    .O(N4)
  );
  X_LUT4 #(
    .INIT ( 16'hAAA9 ),
    .LOC ( "SLICE_X65Y89" ))
  \Msub_F_addsub0004_xor<3>11  (
    .ADR0(A_3_IBUF_255),
    .ADR1(A_1_IBUF_248),
    .ADR2(A_2_IBUF_253),
    .ADR3(A_0_IBUF_246),
    .O(F_addsub0004[3])
  );
  X_LUT4 #(
    .INIT ( 16'h03C8 ),
    .LOC ( "SLICE_X65Y81" ))
  Mmux_F_55_SW0 (
    .ADR0(Ci_IBUF_245),
    .ADR1(A_1_IBUF_248),
    .ADR2(A_0_IBUF_246),
    .ADR3(S_0_IBUF_262),
    .O(N2)
  );
  X_LUT4 #(
    .INIT ( 16'h8CEF ),
    .LOC ( "SLICE_X58Y91" ))
  \Msub_F_addsub0002_cy<2>1_SW0  (
    .ADR0(A_0_IBUF_246),
    .ADR1(A_1_IBUF_248),
    .ADR2(B_0_IBUF_247),
    .ADR3(B_1_IBUF_249),
    .O(N01_pack_1)
  );
  X_LUT4 #(
    .INIT ( 16'hC33C ),
    .LOC ( "SLICE_X63Y91" ))
  \Msub_F_addsub0002_xor<2>11  (
    .ADR0(VCC),
    .ADR1(B_2_IBUF_254),
    .ADR2(A_2_IBUF_253),
    .ADR3(N8),
    .O(\F_addsub0002[2] )
  );
  X_LUT4 #(
    .INIT ( 16'hE44E ),
    .LOC ( "SLICE_X54Y89" ))
  \S<2>1  (
    .ADR0(S_2_IBUF_261),
    .ADR1(Mmux_F_5_f5),
    .ADR2(S_0_IBUF_262),
    .ADR3(S_1_IBUF_260),
    .O(F_4_OBUF_875)
  );
  X_LUT4 #(
    .INIT ( 16'h6666 ),
    .LOC ( "SLICE_X57Y88" ))
  \Madd_F_addsub0001_Madd_lut<1>  (
    .ADR0(B_1_IBUF_249),
    .ADR1(A_1_IBUF_248),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(Madd_F_addsub0001_Madd_lut[1])
  );
  X_LUT4 #(
    .INIT ( 16'h5A5A ),
    .LOC ( "SLICE_X55Y80" ))
  Mmux_F_4 (
    .ADR0(A_1_IBUF_248),
    .ADR1(VCC),
    .ADR2(S_0_IBUF_262),
    .ADR3(VCC),
    .O(Mmux_F_4_447)
  );
  X_LUT4 #(
    .INIT ( 16'h6666 ),
    .LOC ( "SLICE_X57Y89" ))
  \Madd_F_addsub0001_Madd_lut<3>  (
    .ADR0(A_3_IBUF_255),
    .ADR1(B_3_IBUF_256),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(Madd_F_addsub0001_Madd_lut[3])
  );
  X_LUT4 #(
    .INIT ( 16'hA50F ),
    .LOC ( "SLICE_X67Y80" ))
  Mmux_F_5 (
    .ADR0(A_0_IBUF_246),
    .ADR1(VCC),
    .ADR2(S_0_IBUF_262),
    .ADR3(B_0_IBUF_247),
    .O(Mmux_F_5_380)
  );
  X_LUT4 #(
    .INIT ( 16'h5A5A ),
    .LOC ( "SLICE_X57Y89" ))
  \Madd_F_addsub0001_Madd_lut<2>  (
    .ADR0(A_2_IBUF_253),
    .ADR1(VCC),
    .ADR2(B_2_IBUF_254),
    .ADR3(VCC),
    .O(Madd_F_addsub0001_Madd_lut[2])
  );
  X_LUT4 #(
    .INIT ( 16'h8787 ),
    .LOC ( "SLICE_X55Y80" ))
  Mmux_F_52 (
    .ADR0(A_1_IBUF_248),
    .ADR1(B_1_IBUF_249),
    .ADR2(S_0_IBUF_262),
    .ADR3(VCC),
    .O(Mmux_F_52_436)
  );
  X_LUT4 #(
    .INIT ( 16'h6666 ),
    .LOC ( "SLICE_X57Y88" ))
  \Madd_F_addsub0001_Madd_lut<0>1  (
    .ADR0(A_0_IBUF_246),
    .ADR1(B_0_IBUF_247),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(\Madd_F_addsub0001_Madd_lut<0>1_312 )
  );
  X_LUT4 #(
    .INIT ( 16'h5CAC ),
    .LOC ( "SLICE_X67Y81" ))
  Mmux_F_6 (
    .ADR0(A_0_IBUF_246),
    .ADR1(F_addsub0001[0]),
    .ADR2(S_0_IBUF_262),
    .ADR3(B_0_IBUF_247),
    .O(Mmux_F_6_408)
  );
  X_LUT4 #(
    .INIT ( 16'h6F60 ),
    .LOC ( "SLICE_X55Y81" ))
  Mmux_F_61 (
    .ADR0(A_1_IBUF_248),
    .ADR1(N6_0),
    .ADR2(S_0_IBUF_262),
    .ADR3(F_addsub0001[1]),
    .O(Mmux_F_61_464)
  );
  X_LUT4 #(
    .INIT ( 16'h5A55 ),
    .LOC ( "SLICE_X67Y81" ))
  Mmux_F_51 (
    .ADR0(A_0_IBUF_246),
    .ADR1(VCC),
    .ADR2(S_0_IBUF_262),
    .ADR3(Ci_IBUF_245),
    .O(Mmux_F_51_416)
  );
  X_LUT4 #(
    .INIT ( 16'h5555 ),
    .LOC ( "SLICE_X67Y80" ))
  \F_not0000<0>1_INV_0  (
    .ADR0(A_0_IBUF_246),
    .ADR1(VCC),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(F_not0000[0])
  );
  X_LUT4 #(
    .INIT ( 16'hC30F ),
    .LOC ( "SLICE_X55Y86" ))
  Mmux_F_54 (
    .ADR0(VCC),
    .ADR1(B_2_IBUF_254),
    .ADR2(S_0_IBUF_262),
    .ADR3(A_2_IBUF_253),
    .O(Mmux_F_54_491)
  );
  X_LUT4 #(
    .INIT ( 16'h0FF0 ),
    .LOC ( "SLICE_X55Y87" ))
  Mmux_F_55 (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(N2_0),
    .ADR3(A_2_IBUF_253),
    .O(Mmux_F_55_526)
  );
  X_LUT4 #(
    .INIT ( 16'h0FF0 ),
    .LOC ( "SLICE_X55Y86" ))
  Mmux_F_41 (
    .ADR0(VCC),
    .ADR1(VCC),
    .ADR2(S_0_IBUF_262),
    .ADR3(A_2_IBUF_253),
    .O(Mmux_F_41_502)
  );
  X_LUT4 #(
    .INIT ( 16'hF3C0 ),
    .LOC ( "SLICE_X57Y91" ))
  Mmux_F_57 (
    .ADR0(VCC),
    .ADR1(S_0_IBUF_262),
    .ADR2(\F_addsub0004<3>_0 ),
    .ADR3(\F_addsub0003<3>_0 ),
    .O(Mmux_F_57_581)
  );
  X_BUF #(
    .LOC ( "PAD53" ))
  \A<3>/IFF/IMUX  (
    .I(\A<3>/INBUF ),
    .O(A_3_IBUF_255)
  );
  X_LUT4 #(
    .INIT ( 16'hC333 ),
    .LOC ( "SLICE_X57Y90" ))
  Mmux_F_56 (
    .ADR0(VCC),
    .ADR1(S_0_IBUF_262),
    .ADR2(A_3_IBUF_255),
    .ADR3(B_3_IBUF_256),
    .O(Mmux_F_56_546)
  );
  X_BUF #(
    .LOC ( "IPAD58" ))
  \A<0>/IFF/IMUX  (
    .I(\A<0>/INBUF ),
    .O(A_0_IBUF_246)
  );
  X_BUF #(
    .LOC ( "PAD57" ))
  \A<1>/IFF/IMUX  (
    .I(\A<1>/INBUF ),
    .O(A_1_IBUF_248)
  );
  X_BUF #(
    .LOC ( "IPAD54" ))
  \B<0>/IFF/IMUX  (
    .I(\B<0>/INBUF ),
    .O(B_0_IBUF_247)
  );
  X_LUT4 #(
    .INIT ( 16'hE4E4 ),
    .LOC ( "SLICE_X55Y87" ))
  Mmux_F_62 (
    .ADR0(S_0_IBUF_262),
    .ADR1(F_addsub0001[2]),
    .ADR2(\F_addsub0002<2>_0 ),
    .ADR3(VCC),
    .O(Mmux_F_62_517)
  );
  X_LUT4 #(
    .INIT ( 16'h7B48 ),
    .LOC ( "SLICE_X57Y91" ))
  Mmux_F_63 (
    .ADR0(N4_0),
    .ADR1(S_0_IBUF_262),
    .ADR2(A_3_IBUF_255),
    .ADR3(F_addsub0001[3]),
    .O(Mmux_F_63_573)
  );
  X_BUF #(
    .LOC ( "PAD56" ))
  \A<2>/IFF/IMUX  (
    .I(\A<2>/INBUF ),
    .O(A_2_IBUF_253)
  );
  X_LUT4 #(
    .INIT ( 16'hA556 ),
    .LOC ( "SLICE_X55Y81" ))
  Mmux_F_53 (
    .ADR0(A_1_IBUF_248),
    .ADR1(Ci_IBUF_245),
    .ADR2(S_0_IBUF_262),
    .ADR3(A_0_IBUF_246),
    .O(Mmux_F_53_471)
  );
  X_LUT4 #(
    .INIT ( 16'h3C3C ),
    .LOC ( "SLICE_X57Y90" ))
  Mmux_F_42 (
    .ADR0(VCC),
    .ADR1(S_0_IBUF_262),
    .ADR2(A_3_IBUF_255),
    .ADR3(VCC),
    .O(Mmux_F_42_557)
  );
  X_BUF #(
    .LOC ( "PAD50" ))
  \Ci/IFF/IMUX  (
    .I(\Ci/INBUF ),
    .O(Ci_IBUF_245)
  );
  X_BUF #(
    .LOC ( "IPAD108" ))
  \S<2>/IFF/IMUX  (
    .I(\S<2>/INBUF ),
    .O(S_2_IBUF_261)
  );
  X_BUF #(
    .LOC ( "PAD51" ))
  \B<3>/IFF/IMUX  (
    .I(\B<3>/INBUF ),
    .O(B_3_IBUF_256)
  );
  X_BUF #(
    .LOC ( "IPAD103" ))
  \S<0>/IFF/IMUX  (
    .I(\S<0>/INBUF ),
    .O(S_0_IBUF_262)
  );
  X_BUF #(
    .LOC ( "PAD52" ))
  \B<2>/IFF/IMUX  (
    .I(\B<2>/INBUF ),
    .O(B_2_IBUF_254)
  );
  X_BUF #(
    .LOC ( "IPAD83" ))
  \S<1>/IFF/IMUX  (
    .I(\S<1>/INBUF ),
    .O(S_1_IBUF_260)
  );
  X_BUF #(
    .LOC ( "IPAD55" ))
  \B<1>/IFF/IMUX  (
    .I(\B<1>/INBUF ),
    .O(B_1_IBUF_249)
  );
  X_LUT4 #(
    .INIT ( 16'h4F04 ),
    .LOC ( "SLICE_X59Y91" ))
  \Msub_F_addsub0002_xor<4>111  (
    .ADR0(A_2_IBUF_253),
    .ADR1(B_2_IBUF_254),
    .ADR2(A_3_IBUF_255),
    .ADR3(B_3_IBUF_256),
    .O(\Msub_F_addsub0002_xor<4>11 )
  );
  X_LUT4 #(
    .INIT ( 16'hFC0C ),
    .LOC ( "SLICE_X58Y89" ))
  Mmux_F_7 (
    .ADR0(VCC),
    .ADR1(Madd_F_addsub0001_Madd_cy[3]),
    .ADR2(S_0_IBUF_262),
    .ADR3(\F_addsub0002[4] ),
    .O(Mmux_F_7_734)
  );
  X_LUT4 #(
    .INIT ( 16'hDF0D ),
    .LOC ( "SLICE_X59Y91" ))
  \Msub_F_addsub0002_xor<4>112  (
    .ADR0(A_2_IBUF_253),
    .ADR1(B_2_IBUF_254),
    .ADR2(A_3_IBUF_255),
    .ADR3(B_3_IBUF_256),
    .O(\Msub_F_addsub0002_xor<4>111_710 )
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  \F<1>/OUTPUT/OFF/OMUX  (
    .I(\F_1_OBUF/F6MUX_438 ),
    .O(\F<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD23" ))
  \F<4>/OUTPUT/OFF/OMUX  (
    .I(F_4_OBUF_875),
    .O(\F<4>/O )
  );
  X_BUF #(
    .LOC ( "PAD37" ))
  \F<2>/OUTPUT/OFF/OMUX  (
    .I(\F_2_OBUF/F6MUX_493 ),
    .O(\F<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  \F<0>/OUTPUT/OFF/OMUX  (
    .I(\F_0_OBUF/F6MUX_382 ),
    .O(\F<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD24" ))
  \F<3>/OUTPUT/OFF/OMUX  (
    .I(\F_3_OBUF/F6MUX_548 ),
    .O(\F<3>/O )
  );
  X_ONE   NlwBlock_P6_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

