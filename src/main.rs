#![no_std] // don't link the Rust standard library
#![no_main] // disable all Rust-level entry points

/// This function is called on panic.
#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

/// This is the entry symbol
#[no_mangle] // don't mangle the name of this function
pub extern "C" fn _start() -> ! {
    panic!()
}
