import 'dart:convert';
import 'dart:typed_data';

import 'package:agent_dart_base/principal/utils/utils.dart';
import 'package:agent_dart_base/utils/u8a.dart';
import 'package:agent_dart_ffi/agent_dart_ffi.dart';
import 'package:dart_bs58check/dart_bs58check.dart';

/// The canonical instance of [WIFEncoder].
const wifDecoder = WIFDecoder();

/// The canonical instance of [WIFDecoder].
class WIFDecoder extends Converter<String, WIF> {
  const WIFDecoder();

  /// Convert [String] to [WIF]
  @override
  WIF convert(String input, [int? version]) {
    final buffer = bs58check.decode(input);
    if (version != null && buffer[0] != version) {
      throw ArgumentError('Invalid network version');
    }

    // uncompressed
    if (buffer.lengthInBytes == 33) {
      return WIF(version: buffer[0], privateKey: buffer.sublist(1));
    }

    // invalid length
    if (buffer.length != 34) {
      throw ArgumentError('Invalid WIF length');
    }

    // invalid compression flag
    if (buffer[33] != 0x01) {
      throw ArgumentError('Invalid compression flag');
    }

    // compressed
    return WIF(
      version: buffer[0],
      privateKey: buffer.sublist(1, 33),
      compressed: true,
    );
  }
}

/// The canonical instance of [WIFEncoder].
const wifEncoder = WIFEncoder();

/// Encode [WIF] to [String]
class WIFEncoder extends Converter<WIF, String> {
  const WIFEncoder();

  /// Convert [WIF] to [String]
  @override
  String convert(WIF input) {
    if (input.privateKey.length != 32) {
      throw ArgumentError('Invalid privateKey length');
    }

    final result = Uint8List(input.compressed ? 34 : 33);
    result[0] = input.version;
    result.setRange(1, 33, input.privateKey);

    // if is compressed, add compressed flag
    if (input.compressed) {
      result[33] = 0x01;
    }

    return bs58check.encode(result);
  }
}

/// WIF
class WIF {
  WIF({
    required this.version,
    required this.privateKey,
    this.compressed = false,
  });

  /// Version
  int version;

  /// Private Key
  Uint8List privateKey;

  /// Is Compressed WIF ?
  bool compressed;

  static WIF fromHex(
    Uint8List u8a, {
    Network network = Network.Bitcoin,
  }) {
    final version = network == Network.Bitcoin ? 0x80 : 0xef;
    return WIF(version: version, privateKey: u8a);
  }

  /// equal operator
  @override
  bool operator ==(covariant WIF other) {
    return version == other.version &&
        privateKey.map((e) => e.toRadixString(16).padLeft(2, '0')).join() ==
            privateKey.map((e) => e.toRadixString(16).padLeft(2, '0')).join() &&
        compressed == other.compressed;
  }

  /// Hash code
  @override
  int get hashCode => Object.hashAll([version, privateKey, compressed]);

  /// To String
  @override
  String toString() {
    final str = [
      '"version": "$version"',
      '"privateKey": "${privateKey.map((e) => e.toRadixString(16).padLeft(2, '0')).join()}"',
      '"compressed": ${compressed.toString()}'
    ];

    return "{${str.join(",")}}";
  }
}
