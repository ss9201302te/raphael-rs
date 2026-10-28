# Sourced by the *-windows.sh scripts. Selects the GNU toolchain (which ships its own linker and
# dlltool) so that the web version can be built on Windows without the MSVC build tools.

channel=$(sed -n 's/^channel = "\(.*\)"/\1/p' "$(dirname "${BASH_SOURCE[0]}")/../rust-toolchain.toml")
export RUSTUP_TOOLCHAIN="$channel-x86_64-pc-windows-gnu"
rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal -c rust-src -t wasm32-unknown-unknown
export PATH="$(rustc --print sysroot)/lib/rustlib/x86_64-pc-windows-gnu/bin/self-contained:$PATH"
