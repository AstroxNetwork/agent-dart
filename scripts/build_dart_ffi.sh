#!/bin/bash
flutter_rust_bridge_codegen \
-r rust/src/api.rs \
-c rust/headers/bridge_generated.h \
-d rust/bridge/ffi/bridge_generated.dart
## there is bug using latest generator

cp rust/bridge/ffi/bridge_generated.dart lib/bridge/ffi/ffi_bridge.dart
