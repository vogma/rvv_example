CLANG_FLAGS=-O3 -march=rv64gcv_zba -g -c

go: main
	qemu-riscv64 -cpu rv64,v=true,zba=true,vlen=128,vext_spec=v1.0 ./main

main.o: main.c makefile
	clang $(CLANG_FLAGS) main.c -o $@

vec.o: vec.S makefile
	clang $(CLANG_FLAGS) vec.S -o $@

main: main.o vec.o makefile
	riscv64-unknown-elf-gcc main.o vec.o -o $@ -lm
