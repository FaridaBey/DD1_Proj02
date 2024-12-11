# Sequential 8-bit Signed Multiplier Implementation on Basys 3 FPGA

## Overview

This project involves the design and implementation of a sequential 8-bit signed multiplier using the shift-and-add algorithm. The implementation is realized on the Artix 7 FPGA, integrated into the Basys 3 FPGA board. The multiplier accepts two 8-bit signed numbers in two's complement notation as inputs and produces a 16-bit signed product.

## Features

- **Input Mechanism**:
  - Multiplier: Toggle switches `SW7` to `SW0` for an 8-bit signed multiplier.
  - Multiplicand: Toggle switches `SW15` to `SW8` for an 8-bit signed multiplicand.
- **Output Display**:
  - Product: The right three 7-segment display digits show the decimal product.
  - Sign: The leftmost 7-segment digit displays the sign of the product.
- **Controls**:
  - Scrolling: Push buttons `BTNL` and `BTNR` enable scrolling through the product digits.
  - Start: Push button `BTNC` initiates the multiplication process.
  - Completion Indicator: LED `LD0` lights up upon completion of the multiplication.

## Modules

1. **Multiplier**: Implements the shift-and-add algorithm to multiply the signed inputs, considering their two's complement representation.
2. **bin\_to\_BCD**: Converts the 16-bit binary product into Binary-Coded Decimal (BCD) for display.
3. **Control Unit (CU)**: Handles user interactions (scrolling and start signals) and generates control signals for display.
4. **top\_module**: Integrates all components and manages signals for FPGA outputs.
5. **BCD\_to\_7Seg**: Converts BCD digits to 7-segment display signals.
6. **Clock Divider**: Reduces the clock speed for stable operation.
7. **Pushbutton Detector**: Processes noisy input signals from push buttons into stable rising-edge signals.
8. **Synchronizer and Debouncer**: Ensure signal stability and synchronization for input signals.

## Block Diagram

A detailed block diagram of the system is included in the project documentation, illustrating the interaction between the modules.

## Implementation Details

- **Algorithm**: Shift-and-add multiplication.
- **Clock Management**: A slower clock is generated using a clock divider.
- **Signal Processing**: Modules ensure stable and synchronized input signals.
- **Display Management**: BCD conversion and multiplexing for the 7-segment displays.

## Challenges

The implementation was completed without reported errors or issues, meeting the project specifications as described in the handout.


