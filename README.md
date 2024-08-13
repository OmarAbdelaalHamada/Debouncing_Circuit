
# Debouncing Circuit in Verilog

## Overview

This project implements a debouncing circuit using Verilog, designed to eliminate the effects of button bouncing in digital systems. The debouncing circuit ensures that each button press or release is registered as a single, clean, and stable logic level. The project comprises four main modules: Timer, FSM, Synchronizer, and Debouncing Circuit.

## Modules

### 1. **Timer Module**
   - Introduces a delay or time interval before considering a button press or release transition as valid.
   - Helps filter out transient changes and bouncing noise from the button signal.

### 2. **FSM (Finite State Machine) Module**
   - Manages the states of the debouncing circuit.
   - Transitions between states based on the input signals and the delay provided by the Timer module.

### 3. **Synchronizer Module**
   - Ensures that the asynchronous button input is synchronized with the system clock.
   - Prevents metastability and provides a clean input signal to the FSM.

### 4. **Debouncing Circuit Module**
   - The top-level module that integrates the Timer, FSM, and Synchronizer modules.
   - Outputs a stable and debounced signal based on the button input.

## Simulation and Verification

- **Test Bench:**  
  A comprehensive test bench is provided to verify the functionality of the debouncing circuit. The test bench simulates various scenarios, including button presses, releases, and bouncing effects, to ensure the circuit responds correctly.

- **Simulation:**  
  The design has been simulated using ModelSim. The test bench and a `do` file (`run.do`) are included in the repository to automate the simulation process.

## FPGA Implementation

- **Vivado:**  
  The design has been synthesized and implemented using Vivado. The FPGA flow was completed successfully, resulting in the generation of the bitstream file.

## Debouncing Technique: Delay Detection

The delay detection technique involves introducing a time delay before recognizing a button press or release as a valid transition. This approach helps in:
- Filtering out the bouncing noise that occurs when a button is pressed or released.
- Ensuring that only stable transitions are recognized, making the circuit robust and reliable.

## Repository Structure

- `src/`: Contains the Verilog source files for the Timer, FSM, Synchronizer, and Debouncing Circuit modules.
- `tb/`: Contains the test bench (`tb_debouncing_circuit.v`) and `do` file (`run.do`) for simulation.
- `docs/`: Any additional documentation or diagrams related to the project.
- `vivado/`: Contains Vivado project files and configuration.

## Getting Started

### Prerequisites

- **ModelSim:** For running the simulation.
- **Vivado:** For FPGA synthesis and implementation.

### Running the Simulation

1. Open ModelSim.
2. Load the `run.do` file from the `tb/` directory.
3. Run the simulation to verify the functionality of the debouncing circuit.

### FPGA Implementation

1. Open Vivado and create a new project.
2. Add the Verilog source files from the `src/` directory.
3. Run synthesis, implementation, and generate the bitstream file.


## Acknowledgments

- Special thanks to the open-source community and all those who contribute to the development of FPGA tools and resources.

## Contact

For any inquiries or contributions, feel free to contact me at [omark0635@gmail.com].


