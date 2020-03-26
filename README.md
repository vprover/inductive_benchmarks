# Inductive benchmarks

This repository contains various benchmarks requiring inductive reasoning.

## Running Vampire on these benchmarks

You can get the source code of Vampire at https://github.com/vprover/vampire,
or, if you want the version with generalized induction, at
https://github.com/vprover/vampire/tree/hzzv-induction1.
To build it, simply `make vampire_rel`.

To run Vampire with structural induction on the benchmarks in SMT-LIB2
format, use the option `--input_syntax smtlib2 -ind struct`.
To turn on generalized induction, add `-indgen on`, and optionally
also `-indgenss N` to limit the maximum number of occurrences of a term
selected for induction to N.

## Organization of this repository (subject to change)

First level of directories categorizes benchmarks by data types used
in them.
Second level of directories groups benchmarks by the type problem
(e.g., associativity of plus with three variables).
Third level of directories categorizes benchmarks by the input format.
