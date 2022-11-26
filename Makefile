CARGO=cargo
QEMU=qemu-system-x86_64
TERM=st
GDB=gdb

.PHONY: bootimage dbootimage run clean debug

all: bootimage

bootimage: 
	@CARGO_MANIFEST_DIR=$(shell pwd) $(CARGO) bootimage

dbootimage: 
	@RUSTFLAGS=-g CARGO_MANIFEST_DIR=$(shell pwd) $(CARGO) bootimage

run: bootimage
	@$(QEMU) -drive format=raw,file=target/x86_64-os/debug/bootimage-os.bin

debug: dbootimage
	@$(TERM) $(QEMU) -drive format=raw,file=target/x86_64-os/debug/bootimage-os.bin -S -s & 
	@$(GDB) -ex 'target remote localhost:1234' \
		-ex 'break *0x201410' \
		-ex 'continue'

clean:
	@rm -rf target
