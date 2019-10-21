/////////////////////////////////////////////////////////////////////////////////////
// Copyright 2019 seabeam@yahoo.com - Licensed under the Apache License, Version 2.0
// For more information, see LICENCE in the main folder
/////////////////////////////////////////////////////////////////////////////////////
`ifndef YUU_AHB_SLAVE_AGENT_SVH
`define YUU_AHB_SLAVE_AGENT_SVH

class yuu_ahb_slave_agent extends uvm_agent;
  yuu_ahb_slave_sequencer sequencer;
  yuu_ahb_slave_driver    driver;
  yuu_ahb_slave_monitor   monitor;

  yuu_ahb_slave_config  cfg;

  uvm_analysis_port  #(yuu_ahb_slave_item)  out_driver_ap;
  uvm_analysis_port  #(yuu_ahb_item)        out_monitor_ap;

  `uvm_component_utils_begin(yuu_ahb_slave_agent)
  `uvm_component_utils_end

  extern         function      new(string name, uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
endclass

function yuu_ahb_slave_agent::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction

function void yuu_ahb_slave_agent::build_phase(uvm_phase phase);
  if (!uvm_config_db #(yuu_ahb_slave_config)::get(null, get_full_name(), "cfg", cfg) && cfg == null)
   `uvm_fatal("build_phase", "Cannot get yuu_ahb_slave agent configuration");
  monitor = yuu_ahb_slave_monitor::type_id::create("monitor", this);
  monitor.cfg = cfg;
  if (cfg.is_active == UVM_ACTIVE) begin
    uvm_config_db #(yuu_ahb_slave_config)::set(this, "sequencer", "cfg", cfg);
    sequencer = yuu_ahb_slave_sequencer::type_id::create("sequencer", this);
    driver    = yuu_ahb_slave_driver::type_id::create("driver", this);
    driver.cfg = cfg;
  end
endfunction

function void yuu_ahb_slave_agent::connect_phase(uvm_phase phase);
  out_monitor_ap = monitor.out_monitor_ap;
  monitor.vif = cfg.vif;
  monitor.events = cfg.events;

  if (cfg.is_active == UVM_ACTIVE) begin
    driver.seq_item_port.connect(sequencer.seq_item_export);
    driver.vif  = cfg.vif;
    driver.events = cfg.events;
    out_driver_ap = driver.out_driver_ap;
  end
endfunction

`endif