# Pipelined MAC Unit Using VHDL

## Overview
This project implements a Multiply-Accumulate (MAC) unit using VHDL and AMD Vivado.

A MAC unit performs multiplication followed by addition.

**Equation:**

`RESULT = (A × B) + C`

## Design Specifications
- **HDL:** VHDL
- **Design Tool:** AMD Vivado 2026.1
- **Target FPGA:** Artix-7 (`xc7a12tcsg325-1`)
- **Input A:** 8-bit unsigned
- **Input B:** 8-bit unsigned
- **Input C:** 16-bit unsigned
- **Output:** 16-bit result

## Architecture
The design contains:
1. An 8-bit × 8-bit multiplier
2. An adder to add the multiplication result and input C
3. A clocked output register
4. An active-high reset

## Verification
The testbench checks these example calculations:

| A | B | C | Expected Result |
|---:|---:|---:|---:|
| 10 | 20 | 5 | 205 |
| 5 | 10 | 20 | 70 |
| 15 | 15 | 10 | 235 |
| 100 | 2 | 50 | 250 |
| 200 | 3 | 100 | 700 |

## Project Files
- `MAC unit.vhd` — main RTL design
- `testbench.vhd` — simulation testbench

## Future Improvements
- Implement a pipelined MAC architecture
- Add timing constraints and analyze timing reports
- Compare resource utilization and maximum operating frequency
- Explore FPGA DSP resource inference

## Learning Outcomes
This project explores RTL design, arithmetic hardware, synchronous registers, VHDL simulation, and FPGA synthesis.
