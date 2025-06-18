# Nano Processor Version-2

Nano Processor Version-2 is a 4-bit custom-designed processor written in VHDL. It is the second version of a minimalistic processor architecture designed for educational and experimental use on FPGA boards. 
This is an extension of the previous version 1 of the nano processor. **https://github.com/lakaThabrew/Nano_processor_Version_1**

## 🧠 Features

- **4-bit Data Width**  
  Supports 4-bit wide instructions, operations, and data handling.

- **Programme Counter**  
  Supports 16 instruction sets.
    
- **Instruction Set**  
  Custom instruction set implemented via ROM and 14-bit instruction decoder.

- **General-Purpose Registers**  
  8-register bank with enable logic and individual output lines.

- **ALU (Arithmetic Logic Unit)**  
  Performs addition, subtraction, and comparison operations, bitwise and, or, not and right shifts till 2 positions with:
  - Zero Flag
  - Overflow Flag
  - Carry-Out Flag
  - Sign Bit
  - Comparison Flags (Equal, Greater, Lesser)

- **Control Unit**  
  - Instruction decoder
  - Jump logic
  - Load immediate selection
  - Register selection and enable logic

- **Clock Control**  
  Includes a slow clock module for simulation and FPGA timing compatibility.

- **Display Output**  
  7-segment display (via LUT) showing register 7 value with `AnodeSelector` and `S_7Seg` outputs.

## 📦 Architecture Overview

The top-level module integrates the following submodules:

- `Program_Counter_v2`
- `ROM_v2`
- `Instruction_Decoder_v2`
- `Registers_Bank`
- `ALU`
- `Mux_2_4bit`, `Mux_8_4bit_new`
- `Adder_4bit`
- `LUT_16_7`
- `Slow_Clk`

Each submodule plays a role in the instruction fetch-decode-execute cycle.

## 🔧 Usage

### Prerequisites
- Xilinx Vivado or any VHDL-compatible FPGA development environment.
- FPGA board (e.g., Basys 3 or similar with 7-segment display support).

### Simulation
Use the behavioral simulation feature in your VHDL toolchain to test processor instructions and verify outputs.

### Synthesis
Ensure the top module is set as `Nano_processor_V2` for synthesis.

## 🗂️ File Structure

```bash
📁 nano-processor-v2
├── Nano_processor_V2.vhd         # Top-level architecture
├── Program_Counter_v2.vhd        # 4-bit program counter
├── ROM_v2.vhd                    # Instruction memory
├── Instruction_Decoder_v2.vhd    # Decodes 14-bit instruction
├── Registers_Bank.vhd            # 8 general-purpose 4-bit registers
├── Mux_2_4bit.vhd                # 2-to-1 4-bit multiplexer
├── Mux_8_4bit_new.vhd            # 8-to-1 4-bit multiplexer
├── ALU.vhd                       # Arithmetic and logic unit
├── Adder_4bit.vhd                # 4-bit adder used in PC
├── Slow_Clk.vhd                  # Slow clock generator
├── LUT_16_7.vhd                  # Lookup table for 7-segment display
```

### 🧪 Test & Debug
#### You can test functionality by simulating:

- Instruction flow (fetch → decode → execute)
- Arithmetic operations
- Register writes and outputs
- Jump and control instructions

### ⚙️ Future Improvements
- Support for more operations (AND, OR, XOR, shift, etc.)
- Support for branching conditions
- Pipeline execution
- Data memory module

### 📜 License
#### This project is open-source and free to use for educational and non-commercial purposes. For commercial usage, please contact the author.

### 👨‍💻 Author
  #### Created by: Lakmana Thabrew           Date: May 17, 2025                 Language: VHDL
