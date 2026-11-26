# Digital Logic Foundations

A hands-on collection of digital logic designs written in Verilog HDL while building a foundation for RTL Design and Design Verification.

## Designs currently included

- AND gate
- 4-bit ALU (ADD, SUB, AND, OR)
- 4-bit comparator
- 2-to-4 decoder
- 4-to-2 encoder
- Priority encoder with valid output
- Half adder and full adder
- 4-to-1 multiplexer
- 4-bit ripple-carry adder
- 8-bit barrel shifter (three-stage, shift-by-1/2/4 architecture)

Each design is kept in a separate Verilog source file. Available testbenches use a mix of directed stimulus and self-checking comparisons.

## Tools

- Verilog HDL
- Icarus Verilog for simulation
- GTKWave for waveform inspection

## Running a simulation

Compile a design with its testbench:

```bash
iverilog -g2012 -o sim halfadder.v halfadder_tb.v
vvp sim
```

For a design that instantiates another module, include the required RTL source files. The ripple-carry adder uses `full_adder.v`:

```bash
iverilog -g2012 -o sim full_adder.v ripple_carry_adder4bit.v ripple_carry_adder4bit_tb.v
vvp sim
```

Open a generated waveform:

```bash
gtkwave halfadder.vcd
```

## Verification status

- The half-adder testbench checks all four input combinations with a self-checking comparison.
- The priority-encoder testbench checks all 16 input combinations.
- The ripple-carry-adder testbench checks all 512 combinations of its two 4-bit operands and carry-in.
- Several other testbenches currently use directed stimulus and waveform/console monitoring rather than self-checking assertions.
- The barrel-shifter RTL is present; a dedicated testbench is still pending.

These are source-level project notes. Run the simulations locally before treating a design as verified. No synthesis or FPGA implementation results are claimed here.

## Current learning focus

Strengthening RTL fundamentals, writing independent testbenches, debugging corner cases, and explaining design decisions clearly.
