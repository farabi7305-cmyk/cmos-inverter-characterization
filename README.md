# CMOS Inverter Characterization

A hardware and simulation-based characterization project of a CMOS inverter using discrete MOSFETs. The inverter was implemented on a breadboard, experimentally tested using a 5 V supply, and simulated in PSpice to verify the voltage transfer characteristic (VTC).

## Demonstration Video

A short video demonstrating the hardware setup and the CMOS inverter switching behavior is available here:

**▶ [Watch the project demonstration](https://youtu.be/BmHOWdDQZPM)**

You can also scan the QR code below to open the video on a mobile device:

<p align="center">
  <img src="docs/demo_video_qr.png" alt="QR code linking to the project demonstration video" width="180">
</p>

## Project Overview

The purpose of this project is to study the operation of a CMOS inverter and observe how the output voltage changes with input voltage. The circuit uses a complementary PMOS-NMOS structure where the common gate node acts as the input and the common drain node acts as the output.

The experimental VTC was obtained by sweeping the input voltage from 0 V to 5 V and measuring the corresponding output voltage. A PSpice DC sweep simulation was also performed using generic MOSFET models to verify the expected inverter behavior.

## Key Results

| Parameter | Value |
|---|---:|
| Supply voltage, VDD | 5 V |
| Experimental HIGH output, VOH | 4.82 V |
| Experimental LOW output, VOL | 0.00 V |
| Experimental switching voltage, VM | 2.996 V |
| Simulated switching voltage | Approximately 2.5 V |
| Experimental load condition | Unloaded during VTC measurement |
| Simulation load condition | Unloaded |

The experimental switching voltage was higher than the ideal mid-supply value of 2.5 V. This difference is mainly due to practical MOSFET characteristics, threshold-voltage mismatch, breadboard effects, and measurement limitations.

## Hardware Implementation

The practical circuit was built on a breadboard using discrete MOSFETs.

Hardware components:

- IRF9540 PMOS transistor
- IRF3710 NMOS transistor
- DC power supply
- Breadboard
- Multimeter
- Connecting wires
- LED and 1 kΩ resistor for visual output indication

The measured VTC data was taken without the LED load connected, so the output voltage represents the unloaded common-drain output node.

## Simulation

PSpice simulation was performed using a DC sweep analysis.

Simulation setup:

| Parameter | Value |
|---|---|
| Analysis type | DC Sweep |
| Sweep source | Vin |
| Sweep range | 0 V to 5 V |
| Step size | 0.01 V |
| Supply voltage | VDD = 5 V |
| Output node | Vout |
| MOSFET models | MbreakP and MbreakN |

Generic PSpice MOSFET models were used for qualitative verification. Therefore, the simulated switching voltage is not expected to exactly match the experimental switching voltage.

## Repository Structure

```text
cmos-inverter-characterization/
├── README.md
├── .gitignore
│
├── report/
│   └── CMOS_Inverter_Project_Report.pdf
│
├── hardware/
│   ├── breadboard_setup.jpg
│   └── circuit_diagram.png
│
├── simulation/
│   ├── pspice_schematic.png
│   ├── pspice_vtc_plot.png
│   └── README.md
│
├── data/
│   └── measured_vtc_data.csv
│
├── analysis/
│   └── plot_cmos_vtc.m
│
├── plots/
│   └── experimental_vtc_curve.png
│
└── docs/
    ├── demo_video_qr.png
    └── references.md
```

## How to Reproduce the Plot

Using the measured data:

1. Open the CSV file from the `data/` folder.
2. Run the MATLAB script from the `analysis/` folder.
3. The script plots the experimental voltage transfer characteristic.
4. The switching voltage is obtained from the intersection of the fitted VTC curve with the line `Vout = Vin`.

## Experimental Observation

For low input voltage, the PMOS transistor remains ON and the NMOS transistor remains OFF. Therefore, the output is pulled close to VDD and becomes logic HIGH.

For high input voltage, the PMOS transistor turns OFF and the NMOS transistor turns ON. Therefore, the output is pulled down to ground and becomes logic LOW.

In the transition region, both transistors conduct partially, and the output changes rapidly from HIGH to LOW.

## Simulation vs Experiment

The simulated VTC shows an ideal-like inverter transition near the mid-supply voltage. The experimental VTC shows a switching voltage of about 3.0 V. The difference is reasonable because the simulation uses generic MOSFET models, while the hardware circuit uses real discrete power MOSFETs.

Possible causes of difference:

- threshold-voltage mismatch between PMOS and NMOS devices
- non-ideal behavior of discrete power MOSFETs
- breadboard contact resistance
- wiring parasitics
- measurement limitations
- use of generic MOSFET models in simulation

## Tools Used

- PSpice / OrCAD Capture
- MATLAB
- Breadboard-based hardware testing
- Digital multimeter
- DC power supply

## Notes

Vendor-specific or proprietary SPICE model files should not be uploaded publicly unless redistribution is permitted by the model license. Generic PSpice models are sufficient here because the purpose of simulation is to verify the qualitative CMOS inverter behavior.

## Authors

EEE 202 Electronic Circuits I Laboratory Project  
Department of Electrical and Electronic Engineering  
Bangladesh University of Engineering and Technology

## License

This repository is intended for academic and portfolio use. Add a license file if the project is made public.
