# References

This document lists the main references and resources used for the CMOS inverter characterization project.

## Textbook Reference

1. Adel S. Sedra and Kenneth C. Smith, *Microelectronic Circuits*, Oxford University Press.

   Used for the basic theory of MOSFET operation, CMOS inverter operation, the voltage transfer characteristic (VTC), and switching behavior.

## Device Datasheets

2. IRF9540 P-Channel Power MOSFET Datasheet.

   Reference datasheet for the PMOS device used in the hardware implementation.

3. IRF3710 N-Channel Power MOSFET Datasheet.

   Reference datasheet for the NMOS device used in the hardware implementation.

## Simulation Tools

4. Cadence OrCAD Capture / PSpice.

   Used for schematic design and DC sweep simulation of the CMOS inverter VTC.

5. PSpice Breakout MOSFET Models.

   Generic `MbreakP` and `MbreakN` MOSFET models were used for qualitative simulation of the CMOS inverter behavior.

## Experimental Resources

6. EEE 202 Electronic Circuits I Laboratory project work.

   The experimental data, breadboard implementation, and measured VTC were obtained from the hardware implementation of the CMOS inverter.

## Notes on Model Usage

The PSpice simulation in this repository uses generic MOSFET models to demonstrate the expected inverter behavior. If vendor-specific or proprietary SPICE model files are used locally, they should not be uploaded publicly unless redistribution is allowed by the model license.

## Suggested Citation for This Project

If referencing this project, use:

```text
CMOS Inverter Characterization using Discrete MOSFETs, EEE 202 Electronic Circuits I Laboratory Project, Bangladesh University of Engineering and Technology.
```
