# 8-BIT-REVERSIBLE-ALU
8-bit ALU designed using DKGP reversible gates in Verilog HDL, supporting arithmetic and logic operations with simulation-based verification.


This project presents the design and verification of an opportunity to 8-bit Arithmetic Logic Unit (ALU) implemented using DKGP reversible logic gates for arithmetic operations. Reversible logic minimizes information loss and is a promising approach for low-power and energy-efficient VLSI systems.

The ALU supports arithmetic and logical operations selected through control signals. The complete design is implemented and verified using Verilog HDL with simulation-based validation.

Design Specifications

| Parameter            | Description             |
| -------------------- | ----------------------- |
| Data Width           | 8-bit                   |
| ALU Type             | Reversible (DKGP-based) |
| Arithmetic Operation | Addition                |
| Logic Operations     | AND, OR, XOR, NOT       |
| Selection Control    | 3-bit SEL               |
| Design Style         | RTL                     |


Implementation Overview

The ALU is organized into modular blocks:

* Reversible Arithmetic Unit using DKGP gates
* Conventional Logic Unit for logical operations
* Top-Level Selector to choose arithmetic or logic output

Arithmetic and logic blocks operate independently, improving readability and scalability.


Functional Description

* When `SEL[2] = 0`, the ALU performs **addition** using a DKGP-based ripple carry adder.
* When `SEL[2] = 1`, the ALU performs **logic operations** based on `SEL[1:0]`.
* Carry output (`COUT`) is generated only during arithmetic operations.

Operation Selection

| SEL | Operation |
| --- | --------- |
| 000 | Addition  |
| 100 | AND       |
| 101 | OR        |
| 110 | XOR       |
| 111 | NOT A     |

Key Design Blocks

1. DKGP Reversible Full Adder

* Implements sum and carry using reversible logic
* Produces garbage outputs to preserve reversibility
* Reduces information loss during computation

2. 8-bit Ripple Carry Adder

* Built using DKGP reversible full adders
* Propagates carry from LSB to MSB
* Ensures accurate arithmetic operation

3. Logic Unit

* Implements AND, OR, XOR, and NOT operations
* Uses combinational logic for efficiency
* Controlled using opcode bits


Testbench (Concept Overview)

The testbench verifies functional correctness through:

* Addition with and without carry
* Logical operations validation
* Edge case testing (overflow scenarios)
* Display-based result monitoring

The design behavior is observed using simulation waveforms.


Simulation and Verification

* Functional verification performed using Verilog testbench
* Outputs validated against expected results
* Waveforms confirm correct ALU behavior and carry propagation

*(Add waveform screenshots here)*


Tools Used

* Verilog HDL
* ModelSim / Vivado Simulator
* RTL Simulation & Verification


Applications

* Low-power VLSI systems
* Reversible and quantum-inspired computing
* Research and academic design exploration

Author<br>
Nithin Gopisetty<br>

📧 nithingopisetty2516@gmail.com<br>
🔗 linkedin.com/in/nithin2516



