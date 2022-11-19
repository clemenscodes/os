# Rust OS

Minimal Rust based operating system for x86-64 architectures.

## Requirements

- Nightly Rust
- bootimage
- QEMU

## Building

This will build the kernel and install bootimage in case it is not yet installed.

```sh
cargo build
```

## Running

This will run the built binary in QEMU using qemu-system-x86_64.

```sh
cargo run
```

Note: Running with cargo without installing bootimage or building first will fail.
