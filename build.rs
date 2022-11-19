fn main() {
    let cargo_home = env!("CARGO_HOME");
    let mut path = std::path::PathBuf::from(cargo_home);
    path.push("bin");
    path.push("bootimage");
    if !path.is_file() {
        let mut cargo = std::process::Command::new("cargo");
        cargo.args(["install", "bootimage"]);
        cargo.status().unwrap();
    }
    println!("cargo:rerun-if-changed={}", path.as_path().display());
}
