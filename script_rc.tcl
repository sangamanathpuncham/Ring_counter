read_liberty /mnt/d/vlsi/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog /mnt/d/vlsi/ringc/ring_synth_net1.v
link_design ring_counter
read_sdc rc.sdc
report_checks -fields {nets cap slew input_pins} -digits {4} > counter_report.rpt
