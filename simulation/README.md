# Simulation

This folder contains the PSpice simulation files and screenshots for the CMOS inverter characterization project.

## Purpose

The simulation was performed to verify the basic voltage transfer behavior of a CMOS inverter. The input voltage was swept from 0 V to 5 V, and the output voltage was observed at the common drain node of the PMOS and NMOS transistors.

The simulation used an unloaded CMOS inverter configuration because the experimental VTC data was measured without the LED load.

## Circuit Configuration

The simulated inverter uses one PMOS and one NMOS transistor in complementary configuration.

| Node / Terminal | Connection    |
| --------------- | ------------- |
| PMOS source     | `VDD = 5 V`   |
| PMOS gate       | `Vin`         |
| PMOS drain      | `Vout`        |
| NMOS drain      | `Vout`        |
| NMOS gate       | `Vin`         |
| NMOS source     | `GND`         |
| PMOS body/bulk  | `VDD`         |
| NMOS body/bulk  | `GND`         |

## MOSFET Models Used

Generic PSpice MOSFET models were used for the simulation:

- `MbreakP` for PMOS
- `MbreakN` for NMOS

These models verify the *qualitative* inverter behavior only. The simulated switching voltage may therefore not exactly match the experimental switching voltage obtained from the hardware circuit, which used IRF9540 and IRF3710 MOSFETs.

## Simulation Setup

| Parameter      | Value       |
| -------------- | ----------- |
| Analysis type  | DC Sweep    |
| Sweep source   | `Vin`       |
| Start value    | 0 V         |
| End value      | 5 V         |
| Increment      | 0.01 V      |
| Supply voltage | `VDD = 5 V` |
| Output node    | `Vout`      |

## Expected Result

The simulated VTC shows the inverting behavior of the CMOS inverter:

```text
Vin ≈ 0 V  →  Vout ≈ 5 V   (low input  → high output)
Vin ≈ 5 V  →  Vout ≈ 0 V   (high input → low output)
```

With the generic Mbreak models, the switching point appears approximately near the mid-supply voltage.

## Files

```text
simulation/
├── README.md
├── pspice_schematic.png
├── pspice_vtc_plot.png
└── schematic_source/
```

If proprietary or licensed MOSFET model files are used, they should not be uploaded publicly unless redistribution is allowed by the model license.

## Notes

The experimental switching voltage may differ from the simulated value due to:

- use of discrete power MOSFETs in the hardware circuit
- threshold-voltage mismatch between PMOS and NMOS devices
- non-ideal MOSFET characteristics
- breadboard contact resistance
- measurement limitations
- use of generic MOSFET models in simulation

The simulation is included mainly to support the experimental observation and demonstrate the expected CMOS inverter voltage transfer characteristic.
