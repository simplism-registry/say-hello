#!/bin/bash
simplism listen \
./target/wasm32-wasi/release/say_hello.wasm handle \
--http-port 8080 \
--log-level info
