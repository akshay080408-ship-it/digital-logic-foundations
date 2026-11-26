# Digital Logic Foundations

A hands-on collection of digital logic designs written in Verilog HDL while building a foundation for RTL Design and Design Verification.

## Topics covered

- Combinational logic: AND gate, multiplexers, decoder, encoder, priority encoder, comparator
- Arithmetic circuits: half adder, full adder, 4-bit ripple-carry adder, 4-bit ALU
- Sequential logic: D, JK, SR and T flip-flops; 4-bit register; shift register
- Counters: 8-bit counter, enabled counter, 4-bit up/down counter, saturating counters
- Control logic: traffic-light controller
- Datapath building block: 8-bit barrel shifter

## Tools

- Verilog HDL
- Icarus Verilog (simulation)
- GTKWave (waveform inspection)

## Repository layout

RTL modules and their testbenches are kept as separate `.v` files. Testbenches are named with the `_tb.v` suffix.

## Running a simulation

Compile a design together with its testbench. For example:

```bash
iverilog -g2012 -o sim halfadder.v halfadder_tb.v
vvp sim
```

For a design that instantiates another module, include every required RTL source file. For example, the ripple-carry adder also needs `full_adder.v`:

```bash
iverilog -g2012 -o sim full_adder.v ripple_carry_adder4bit.v ripple_carry_adder4bit_tb.v
vvp sim
```

Open a generated waveform with:

```bash
gtkwave halfadder.vcd
```

## Verification notes

Some testbenches use directed stimulus and waveform/console monitoring. Others use self-checking comparisons and pass/fail counters. A testbench being present does not by itself mean the design has been exhaustively verified.

The barrel shifter RTL is included; its dedicated testbench is still pending. Simulation results should be reported only after running the corresponding testbench.

## Current focus

Strengthening RTL fundamentals, writing independent testbenches, debugging corner cases, and learning to explain design decisions clearly.
