# 4-Bit ALU with 7-Segment Display Output

A 4-bit Arithmetic Logic Unit (ALU) implemented in VHDL with 7-segment display outputs for visualizing inputs, results, and carry status.

## Features

- **4-bit inputs** (A and B)
- **8 supported operations** (selected by 4-bit operation code)
- **7-segment display outputs** for:
  - Input A
  - Input B
  - Operation result
  - Carry status (for addition)
  
## Supported Operations

| Operation Code | Mnemonic | Description         |
|----------------|----------|---------------------|
| 0001           | AND      | Bitwise AND         |
| 0010           | OR       | Bitwise OR          |
| 0100           | XOR      | Bitwise XOR         |
| 1001           | NAND     | Bitwise NAND        |
| 0011           | NOR      | Bitwise NOR         |
| 0110           | XNOR     | Bitwise XNOR        |
| 1100           | NOT      | Bitwise NOT (of A)  |
| 1110           | ADD      | 4-bit addition      |

## Display Encoding

The 7-segment displays use **active-low** encoding (0 lights up the segment) with the following patterns:

- **Digit display**: Shows values 0-F (hexadecimal)
- **Carry display**: Shows "1" when carry exists, blank otherwise

## Hardware Connection Guide

1. **Input A**: Connect slide switches 1-4 to A(3 downto 0)
2. **Input B**: Connect slide switches 5-8 to B(3 downto 0)
3. **Operation**:
   - Button1 → Operation(3)
   - Button2 → Operation(2)
   - Button3 → Operation(1)
   - Button4 → Operation(0)
4. **Output**:
   - 7-segment display 1: Shows input A
   - 7-segment display 2: Shows input B
   - 7-segment display 3: Shows result
   - 7-segment display 4: Shows carry (blank or '1')

## Suggested Development Boards

Any FPGA board with:
  - Minimum 8 slide switches
  - 4 push buttons
  - 4 7-segment displays

## Simulation Results

![ALU Simulation Waveform](https://github.com/izzo03/ALU/blob/main/images/simulation.PNG)

Key signals shown:
- `A`, `B`: Input operands
- `Operation`: Selected function
- `A_Digit`: 7-segment encoding of input `A`
- `B_Digit`: 7-segment encoding of input `B`
- `Result_Digit`: 7-segment encoding of result
- `Carry_Digit`: Carry status display
