#!/bin/sh

cargo fmt --all -- --check && 
cargo clippy --release -- -D warnings &&
CARGO_MANIFEST_DIR=$(pwd) cargo bootimage --release && 
sleep 0.3 || exit 1
cargo run --release &
sleep 0.5
gvncviewer ::1:5900
