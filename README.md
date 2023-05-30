# Ring_counter


RTL simulation,synthesis and Gate leve simulation of 4-bit Ring Counter:
---
This project simulates the designed 4 bit ring counter. A ring counter is a digital sequential circuit that recirculates the same data throughout the circuit. It is one of the 

applications of shift registers.

A ring counter is a synchronous counter which transfers the same data throughout it. It is a typical application of shift register and can be designed using either D or JK flip-flops

(FFs). Here, a 4-bit ring counter is designed by a series of 4 D-FFs connected together in feedback manner. That means the output of the last FF is connected to the input of the first

FF. The clock signal is applied to all the FFs simultaneously.

Initially all the FFs are at RESET state. When the PRESET is applied, the input of the ring counter becomes 1. Now the output of the first FF (Q3) is 1 and other FF outputs (Q2, Q1 and 

Q0) will be low. Then for the next clock signal, Q2 becomes 1 and others outputs will be low. In this way, as the clock input changes, the outputs change and the data sequence rotates in

the ring counter.



State diagram is used to describe the behaviour of the digital sequential circuits. It shows the transitions of states from one state to the next as well as the output for a given input.

![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/c3bffb56-f7dd-41dd-80eb-144a313ff0c6)

![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/d112e3af-c7aa-419e-94f8-44621fa036ed)


Circuit:
---

![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/54e3120a-99d2-47f4-b6e7-5f75724ed393)


Simulation:
--
iverilog ring.v tb_ring.v

./a.out
 
gtkwave dump.vcd
 
![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/0d221b15-a332-4cbc-b8de-a75255c9e37e)
 


Synthesis:
---

yosys

read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog ring.v
 
synth -top ring_counter

dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 
show

![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/0578540a-3697-41ac-8c63-bf0d5a345b5c)


GLS:
---

 iverilog -DFUNCTIONAL -DUNIT_DELAY=#0 ../sky130RTLDesignAndSynthesisWorkshop/ring/iiitb_4bitrc/verilog_model/primitives.v ../sky130RTLDesignAndSynthesisWorkshop/ring/iiitb_4bitrc/verilog_model/sky130_fd_sc_hd.v ring_synth_net1.v tb_ringc.v
 
 ./a.out
 
 gtkwave dump.vcd

![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/38da23cb-f9ef-4a9b-af47-2fbcd480ccdc)
