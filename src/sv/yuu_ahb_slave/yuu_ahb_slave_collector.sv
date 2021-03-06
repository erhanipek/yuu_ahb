/////////////////////////////////////////////////////////////////////////////////////
// Copyright 2019 seabeam@yahoo.com - Licensed under the Apache License, Version 2.0
// For more information, see LICENCE in the main folder
/////////////////////////////////////////////////////////////////////////////////////
`ifndef YUU_AHB_SLAVE_COLLECTOR_SV
`define YUU_AHB_SLAVE_COLLECTOR_SV

class yuu_ahb_slave_collector extends uvm_subscriber #(yuu_ahb_slave_item);
  virtual yuu_ahb_slave_interface vif;

  yuu_ahb_slave_config  cfg;
  uvm_event_pool        events;

  yuu_ahb_slave_item item;

  covergroup ahb_transaction_cg();
    direction: coverpoint item.direction {
      bins ahb_write = {WRITE};
      bins ahb_read = {READ};
    }
  endgroup

  `uvm_component_utils_begin(yuu_ahb_slave_collector)
  `uvm_component_utils_end

  extern                   function      new(string name, uvm_component parent);
  extern           virtual function void connect_phase(uvm_phase phase);
  extern           virtual task          run_phase(uvm_phase phase);

  extern           virtual function void write(yuu_ahb_slave_item t);
endclass

function yuu_ahb_slave_collector::new(string name, uvm_component parent);
  super.new(name, parent);

  ahb_transaction_cg = new;
endfunction

function void yuu_ahb_slave_collector::connect_phase(uvm_phase phase);
  this.vif = cfg.vif;
  this.events = cfg.events;
endfunction

task yuu_ahb_slave_collector::run_phase(uvm_phase phase);
endtask


function void yuu_ahb_slave_collector::write(yuu_ahb_slave_item t);
  item = yuu_ahb_slave_item::type_id::create("item");
  item.copy(t);
  ahb_transaction_cg.sample();
endfunction

`endif