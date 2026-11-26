# Digital Logic Foundations

A hands-on collection of digital logic designs written in Verilog HDL while building a foundation for RTL Design and Design Verification.

## Combinational logic
- AND gate
- 2-to-1 and 4-to-1 multiplexers
- 2-to-4 decoder
- 4-to-2 encoder and priority encoder
- 4-bit comparator
- 4-bit ALU (addition, subtraction, AND, OR)

## Arithmetic circuits
- Half adder and full adder
- 4-bit ripple-carry adder using structural instantiation

## Sequential logic and control
- D, JK, SR and T flip-flops
- 4-bit register and 4-bit shift register
- 8-bit counter and enabled 8-bit counter
- 4-bit up/down counter with load
- 2-bit saturating counter and quiet counter
- Traffic-light finite-state machine

## Datapath
- 8-bit barrel shifter built from three shift stages (shift by 1, 2 and 4)

## Tools
- Verilog HDL
- Icarus Verilog for simulation
- GTKWave for waveform inspection

## Running a simulation

Compile a design together with its testbench:

```bash
iverilog -g2012 -o sim halfadder.v halfadder_tb.v
vvp sim
```

For a design that instantiates another module, include every required RTL source file. The ripple-carry adder uses `full_adder.v`:

```bash
iverilog -g2012 -o sim full_adder.v ripple_carry_adder4bit.v ripple_carry_adder4bit_tb.v
vvp sim
```

Open a generated waveform with:

```bash
gtkwave halfadder.vcd
```

## Verification notes
- Self-checking testbenches are included for selected designs, including the half adder, priority encoder, mux, counters, register, and traffic-light controller.
- Other testbenches are stimulus-and-waveform demonstrations rather than full self-checking verification.
- The barrel-shifter RTL is included; a dedicated testbench is still pending.
- These files have not all been re-simulated as part of this repository update. Run each testbench locally before treating its design as verified.
- No synthesis, timing-closure, or FPGA implementation results are claimed.

## Current focus
Strengthening RTL fundamentals, writing independent testbenches and reference models, debugging corner cases, and explaining design decisions clearly.
