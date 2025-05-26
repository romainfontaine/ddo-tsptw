#!/usr/bin/env bash

for sz in 64 128 256 512
do
    obj="mk"
    fobj=""

    echo $sz $obj $fobj
    RUSTFLAGS="-C target-cpu=broadwell" CARGO_TARGET_DIR=./rfo-build/${obj}-${sz} cargo build --release --example tsptw ${fobj} --features sz-${sz}

    cp ./rfo-build/${obj}-${sz}/release/examples/tsptw ./rfo-build/tsptw-${obj}-${sz}

    obj="tt"
    fobj="--features travel-time"

    echo $sz $obj $fobj
    RUSTFLAGS="-C target-cpu=broadwell" CARGO_TARGET_DIR=./rfo-build/${obj}-${sz} cargo build --release --example tsptw ${fobj} --features sz-${sz}

    cp ./rfo-build/${obj}-${sz}/release/examples/tsptw ./rfo-build/tsptw-${obj}-${sz}
done

# eg:
# RUSTFLAGS="-C target-cpu=broadwell" CARGO_TARGET_DIR=./tt-512 cargo build --release --example tsptw --features travel-time --features sz-512
