# Stack Memory (LIFO) - Verilog

This project implements a simple stack memory using Verilog.
The stack follows the LIFO (Last In First Out) principle.

## Features

* Push operation (insert data)
* Pop operation (remove data)
* 8x8-bit stack memory
* Full and Empty status signals

## Files

* `stack_memory.v` → Main design module
* `stack_memory_tb.v` → Testbench for simulation

## Description

The design uses a stack pointer (SP) to track the top of the stack.
Data is pushed into memory and popped in reverse order.

## Simulation

The testbench verifies:

* Push operations (10, 20, 30)
* Pop operations (30, 20, 10)
* Full and empty conditions

## Result

Simulation results confirm correct LIFO behavior.

## Author
Ezgi ÖZDABAKOĞLU

[Your Name]

