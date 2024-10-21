# Constraints
This repository contains SystemVerilog examples and techniques focused on constraining random variables in design verification. The aim is to demonstrate how different types of constraints can be used to guide the randomization process for generating meaningful and valid stimuli for testbenches.

# Key Features:
Basic Constraints: Examples of simple constraints such as limiting ranges, fixing values, and controlling random distribution.
Advanced Constraints: Complex scenarios including:
Arithmetic constraints.
Bit-level constraints (e.g., constraining specific bit patterns like even/odd numbers, or numbers with a certain number of bits set).
Constraints for unique values or combinations.
Random Number Generation: Techniques for generating random values with specific properties (e.g., one-bit set numbers, unique lists, or specific patterns).
UVM Integration: Using constraints in conjunction with UVM to create highly flexible testbenches for IP and system-level verification.
Without Built-in Functions: Focus on constraints written without relying on certain SystemVerilog built-in functions like $countones, showcasing creative approaches to achieve constraints.
