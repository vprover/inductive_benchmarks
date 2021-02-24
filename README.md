# Inductive benchmarks

This repository contains various benchmarks requiring inductive reasoning.

## Organization of this repository (subject to change)

Directory `benchmarks` contains the benchmarks:
* Subdirectory `all` contains benchmarks for inductive
data types as well as integers.
* Subdirectory `selected` contains 16 representative benchmarks
capturing selected properties of natural numbers and lists.

Within `selected` and `all`, the benchmarks are organized as follows:
First level of directories categorizes benchmarks by data types used
in them.
Second level of directories groups benchmarks by the type problem
(e.g., associativity of plus with three variables).
Third level of directories categorizes benchmarks by the input format.

Directory `results` contains results generated with a set of solvers
and solver variants. The subdirectories are organized similar to
the `benchmarks` folder for the first two levels. In the leaf directories,
one can find CSV files with results corresponding to benchmark
subdirectories for various solvers.

## Running Vampire on these benchmarks

You can get the source code of Vampire at https://github.com/vprover/vampire.
To build it, simply `make vampire_rel`.
Note: Vampire with integer induction is currently in the branch:
https://github.com/vprover/vampire/tree/int-induction

To run Vampire with structural induction on the benchmarks in SMT-LIB2
format, use the option `--input_syntax smtlib2 -ind struct`.
To turn on generalized induction, add `-indgen on`, and optionally
also `-indgenss N` to limit the maximum number of occurrences of a term
selected for induction to N.

Additionally, to turn on induction for complex terms, add `-indoct on`.

To run Vampire with integer induction, the recommended setting is
`--mode portfolio --schedule integer_induction`.
