/////////////////////////////////////////////////////////////////////////////////////
// Copyright 2019 seabeam@yahoo.com - Licensed under the Apache License, Version 2.0
// For more information, see LICENCE in the main folder
/////////////////////////////////////////////////////////////////////////////////////
`ifndef YUU_AHB_DEFINES_SVH
`define YUU_AHB_DEFINES_SVH
  `ifndef YUU_AHB_MASTER_NUM
  `define YUU_AHB_MASTER_NUM  1
  `endif

  `ifndef YUU_AHB_SLAVE_NUM
  `define YUU_AHB_SLAVE_NUM  1
  `endif

  `ifndef YUU_AHB_ADDR_WIDTH
  `define YUU_AHB_ADDR_WIDTH   32
  `endif
  `undef  YUU_AMBA_BUS_ADDR_WIDTH
  `define YUU_AMBA_BUS_ADDR_WIDTH `YUU_AHB_ADDR_WIDTH

  `ifndef YUU_AHB_DATA_WIDTH
  `define YUU_AHB_DATA_WIDTH   32
  `endif
  `undef  YUU_AMBA_BUS_DATA_WIDTH
  `define YUU_AMBA_BUS_DATA_WIDTH `YUU_AHB_DATA_WIDTH

  `define YUU_AHB_LANE_WIDTH  $clog2(`YUU_AHB_DATA_WIDTH/8)
  `undef  YUU_AMBA_LANE_WIDTH
  `define YUU_AMBA_LANE_WIDTH `YUU_AHB_LANE_WIDTH

  `ifndef YUU_AHB_MASTER_SETUP_TIME
  `define YUU_AHB_MASTER_SETUP_TIME  1
  `endif

  `ifndef YUU_AHB_MASTER_HOLD_TIME
  `define YUU_AHB_MASTER_HOLD_TIME   1
  `endif

  `ifndef YUU_AHB_SLAVE_SETUP_TIME
  `define YUU_AHB_SLAVE_SETUP_TIME   1
  `endif

  `ifndef YUU_AHB_SLAVE_HOLD_TIME
  `define YUU_AHB_SLAVE_HOLD_TIME    1
  `endif

  `ifndef YUU_AHB_MAX_DELAY
  `define YUU_AHB_MAX_DELAY 8
  `endif

`endif