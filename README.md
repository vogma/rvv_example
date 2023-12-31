### This is a fork of [rvv_example](https://github.com/brucehoult/rvv_example) by Bruce Holt. This fork adds the implementation of the vec_len function using [RVV Intrinsics](https://github.com/riscv-non-isa/rvv-intrinsic-doc)

Simple RISC-V Vector example
============================

This is an example of writing the same vector processing function in C
and in assembly language for RISC-V Vector extension v1.0, and comparing
the results.

By default the generated program is run in qemu, but another emulator such
as Spike could also be used, or run on real RVV-capable hardware if you have
it.

### Getting the toolchain

You can follow [this guide](https://github.com/sifive/riscv-llvm/blob/dev/README.md) to setup llvm+clang and the riscv-gnu-toolchain.

### Compiling and running the example

Just type "make"

Expected output:

```
$ make
clang -O3 -march=rv64gcv_zba -g -c main.c -o main.o
clang -O3 -march=rv64gcv_zba -g -c vec.S -o vec.o
riscv64-unknown-elf-gcc main.o vec.o -o main -lm
qemu-riscv64 -cpu rv64,v=true,zba=true,vlen=128,vext_spec=v1.0 ./main
3.741657 3.741657 3.741657
8.774964 8.774964 8.774964
13.928389 13.928389 13.928389
19.104973 19.104973 19.104973
24.289915 24.289915 24.289915
29.478806 29.478806 29.478806
```

You can trace the qemu execution by adding "-singlestep -d nochain,cpu" to the qemu command line.
Cross-reference instruction addresses with the output from "riscv64-unknown-elf-objdump -d main".
