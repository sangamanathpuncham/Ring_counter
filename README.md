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


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/b01c1129-ab62-489f-8174-94579582aa7f)

flop ratio=total dff / total number of cells
                 4/8= 50%

Floorplan:
----

Ring counter is the smaller block so need add following switches to the .tcl file(config.json)

     "FP_PDN_AUTO_ADJUST": 0,
     "FP_PDN_HOFFSET": 7,
     "FP_PDN_VOFFSET": 7,
     "DIE_AREA": "0 0 100 100",
     "CORE_AREA": "10 10 90 90",
     "PL_TARFGET_DESITY":0.55,
     run_floorplan
     

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/1c2e538e-7b0d-4913-b550-a719e98f7b24)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/481dd759-fbdc-4e3e-9492-1acb91b7d9bc)

Placement:
---

     "PL_TARGET_DESITY": 0.55
      run_placement
      
![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/a353a3b6-8e1f-491d-8000-1ca2c34671ec)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/f6986d91-63a9-4186-9886-85df0dff9786)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/a4e34d45-7001-4336-873e-d54d22a98910)



CTS:
----

  run_cts
  
![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/2bbe7ee0-8195-40ba-a1bd-87daa20b0760)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/4338876e-33fa-4094-86fd-354c744ed5fd)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/88c41eea-5c30-4b64-92fc-070ae1ad2c71)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/c4b11b22-b102-46c5-929f-2108f2e00ed6)

ROUTING
----
    gen_pdn
    run_routing


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/b058ae9b-4721-4667-bf89-29df6d3b218b)


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/6eba21bf-166c-44fb-aade-67b4c18a16d7)


      run_parasitics_sta


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/dfb55f80-c536-40c4-94e4-a25c52bf781c)

    
![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/73dbd7b6-173d-48c2-b9cc-fc2ccb22c5c6)


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/94b38b08-b143-4ca0-bba8-84645c382bd4)

tns=0
wns=0

SIGNOFF:
----
PARASITICS
---
    
min_spef and sdf

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/0535aa85-0bbc-48f1-bfc7-852d9a1c452f)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/d1bac792-5d85-4896-a435-102ca2b5ef64)


max_spef and sdf

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/23e5ad90-5779-425d-8009-4bea13e3dd17)


![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/8b49d391-6ece-4991-bc3b-d13f8f1ee852)


IRDROP:
---

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/3c283f7c-74f6-4588-aa1d-902861a0eb96)


run_magic:
-----

    Streaming out GDSII with Magic (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/36-gdsii.log)...

    Generating lef with Magic (/openlane/designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/36-lef.log)...

run_magic_spice_export:
------

Running Magic Spice Export from LEF (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/37-spice.log)...


run_lvs:
-----

Writing Verilog (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/38-write_powered_verilog.log)...

Running LVS (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/40-lvs.lef.log)...

run_magic_drc:
----

[INFO]: Running Magic DRC (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/41-drc.log)...
[INFO]: Converting Magic DRC database to various tool-readable formats...
[INFO]: No DRC violations after GDS streaming out.

run_antenna_check:
-----

Running OpenROAD Antenna Rule Checker (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/42-antenna.log)...

run_erc:
----
[INFO]: Running Circuit Validity Checker ERC (log: designs/ring_counter/runs/RUN_2023.06.27_06.26.48/logs/signoff/43-erc_screen.log)...

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/049a159b-a358-4311-a767-ec9b5b69df7c)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/88969089-d7dc-41d8-a0c3-5c2b6a6bbb5b)

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/fb63862d-fb92-4b20-a9ae-f87b21c1b8a0)

NONINTERACTIVE MODE:
---

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/0f5dd934-19bb-420f-825b-8c4ef1affecf)


CARAVEL INTEGRATION:
-----
     https://github.com/efabless/caravel/,
     
     https://github.com/efabless/caravel_mgmt_soc_litex,

     https://github.com/efabless/caravel_user_project/blob/main/docs/source/index.rst#section-quickstart,

     https://github.com/efabless/caravel/blob/main/openlane/README.rst

       git clone https://github.com/efabless/caravel_mgmt_soc_litex.git


First, I had to modify caravel.py inside the /litex directory of the cloned directory to remove the line that imports SpiFlash.

To install dependencies and build the management core, I used the following commands:

         cd caravel_mgmt_soc_litex
         cd litex
         make setup
         pip3 install git+https://github.com/litex-hub/pythondata-software-compiler_rt.git
         make
The screenshot below shows the successful build of the management core:

![image](https://github.com/sangamanathpuncham/Ring_counter/assets/132802184/5a940d79-263d-4ed1-8d86-37a4743d5801)



Caravel integration: hardening with OpenLane
------
I first created a new repo using the below link:

     https://github.com/efabless/caravel_user_project/generate

Then, I set up the environment using the commands below

      git clone https://github.com/sangamanathpucham/ring_counter_caravel.git
      cd ring_counter_caravel
      mkdir dependencies
      export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src # you need to export this whenever you start a new shell
      export PDK_ROOT=$(pwd)/dependencies/pdks # you need to export this whenever you start a new shell
      export PDK=sky130A
      make setup
      make pdk
      make openlane



