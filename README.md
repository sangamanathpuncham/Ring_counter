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

read_liberty -lib ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog ring.v
 
synth -top ring_counter

dfflibmap -liberty ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
 
abc -liberty  ../../sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

opt_clean -purge
 
show

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/7201e4aa-d2e8-4116-9480-a6bba51dc6ea)


GLS:
---

   iverilog -DFUNCTIONAL -DUNIT_DELAY=#0 ../../sky130RTLDesignAndSynthesisWorkshop/verilog_model/primitives.v ../../sky130RTLDesignAndSynthesisWorkshop/verilog_model/sky130_fd_sc_hd.v    
   ring_synth.v tb_ringc.v
 
 
   ./a.out
   
   gtkwave dump.vcd
 


![image](https://github.com/sangamanathpuncham/VSD_HDP/assets/132802184/38da23cb-f9ef-4a9b-af47-2fbcd480ccdc)


.sdc
-----
    
![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/e9fbb8bc-e80f-4610-890f-022cd2cb9440)



script_rc.tcl
-------
    

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/809d1c8a-589a-4aac-9ef7-3cc320671dff)




OpenSTA 
 ----
    
./sta script_rc.tcl
    
    
 Reports:
 -----
 
 Reg 2 Reg timing path (max)
  
![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/c1b272f1-ee6b-4c71-8dfc-e1459f517323)


STA ON DIFFERENT CORNERS:
-------


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/3e883219-7b06-4556-8db8-051ebf808082)



![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/ee9911c2-6e21-490c-9c16-be222c73f926)



![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/6f0f9872-6971-4dfd-af1c-e469f81d37d6)


TABLE:
----

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/948f5239-66eb-4346-84d4-7b14e06bb4d1)



![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/8f13c33e-cd84-4568-9db8-5027e18590ac)


OPENLANE FLOW:
----
Synthesis:
---

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/3b562116-762a-41d2-b466-416f08afbf81)


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/be21dbc7-c14f-466f-a48e-1e32f5891630)

Floorplan:
----

Ring counter is the smaller block so need add following switches to the .tcl file(config.json)

     "FP_PDN_AUTO_ADJUST": 0,
     "FP_PDN_HOFFSET": 7,
     "FP_PDN_VOFFSET": 7,
     set ::env(DIE_AREA) [list 0 0 80 80]
     set ::env(CORE_AREA) [list 0 0 70 70]
     run_floorplan
     

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/1c2e538e-7b0d-4913-b550-a719e98f7b24)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/481dd759-fbdc-4e3e-9492-1acb91b7d9bc)


