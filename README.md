# 1AEL0245_COD_Grupo3_202610
Proyecto final - Circuitos Lógicos Digitales

Sistema contador digital de 4 dígitos multiplexado implementado 
en VHDL sobre FPGA, desarrollado en Intel Quartus Prime 18.1.

## Descripción
- **Etapa 1:** Contador 00–39 (máquinas de estado Moore)
- **Etapa 2:** Contador 0–12 (máquina de estado Moore)
- **Multiplexación:** Display de 4 dígitos a 1000 Hz
- **Herramienta:** Intel Quartus Prime 18.1 Lite Edition

## Estructura del proyecto
- `Modulo1/` — DivB, contador unidades, decenas, etapa1
- `Modulo2/` — Contador 0–12, MUX 4a1
- `Modulo3/` — DivA, MODB, DecoB
- `Modulo4/` — DecoA, Top Level
