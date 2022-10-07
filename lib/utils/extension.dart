import 'dart:typed_data';

import 'package:typed_data/typed_data.dart';

import 'bn.dart' as bn_util;
import 'hex.dart' as hex_util;
import 'is.dart' as is_util;
import 'string.dart' as string_util;
import 'u8a.dart' as u8a_util;

extension AgentStringExtension on String {
  bool isHex([int bitLength = -1, bool ignoreLength = false]) =>
      is_util.isHex(this, bitLength, ignoreLength);

  bool isHexString() => is_util.isHexString(this);

  String hexAddPrefix() => hex_util.hexAddPrefix(this);

  String hexStripPrefix() => string_util.strip0xHex(this);

  String plainToHex() => u8a_util.u8aToHex(string_util.stringToU8a(this));

  Uint8List toU8a({int bitLength = -1}) => hex_util.hexToU8a(this, bitLength);

  Uint8List plainToU8a({String? enc, bool useDartEncode = false}) =>
      string_util.stringToU8a(this, enc: enc, useDartEncode: useDartEncode);

  BigInt hexToBn({Endian endian = Endian.big, bool isNegative = false}) =>
      hex_util.hexToBn(this, endian: endian, isNegative: isNegative);

  String camelCase() => string_util.stringCamelCase(this);
}

extension AgentU8aExtension on Uint8List {
  Uint8List toU8a() => u8a_util.u8aToU8a(this);

  String toHex({bool include0x = false}) =>
      u8a_util.u8aToHex(this, include0x: include0x);

  String u8aToString({bool useDartEncode = true}) =>
      u8a_util.u8aToString(this, useDartEncode: useDartEncode);

  bool eq(Uint8List other) => u8a_util.u8aEq(this, other);

  BigInt toBn({Endian endian = Endian.little}) =>
      u8a_util.u8aToBn(this, endian: endian);
}

extension AgentU8aBufferExtension on Uint8Buffer {
  Uint8List toU8a() => Uint8List.fromList(this);

  String toHex({bool include0x = false}) =>
      u8a_util.u8aToHex(toU8a(), include0x: include0x);

  String u8aToString({bool useDartEncode = true}) =>
      u8a_util.u8aToString(toU8a(), useDartEncode: useDartEncode);

  bool eq(Uint8List other) => u8a_util.u8aEq(toU8a(), other);

  BigInt toBn({Endian endian = Endian.little}) =>
      u8a_util.u8aToBn(toU8a(), endian: endian);
}

extension AgentBnExtension on BigInt {
  BigInt toBn() => bn_util.bnToBn(this);

  String toHex({
    int bitLength = -1,
    Endian endian = Endian.big,
    bool isNegative = false,
    bool include0x = false,
  }) =>
      bn_util.bnToHex(
        this,
        bitLength: bitLength,
        endian: endian,
        isNegative: isNegative,
        include0x: include0x,
      );

  Uint8List toU8a({
    int bitLength = -1,
    Endian endian = Endian.big,
    bool isNegative = false,
  }) =>
      bn_util.bnToU8a(
        this,
        bitLength: bitLength,
        endian: endian,
        isNegative: isNegative,
      );

  BigInt bitNot({int? bitLength}) => bn_util.bitnot(this, bitLength: bitLength);
}

extension AgentIntExtension on int {
  BigInt toBn() => bn_util.bnToBn(this);

  String toHex({
    int bitLength = -1,
    Endian endian = Endian.big,
    bool isNegative = false,
    bool include0x = false,
  }) =>
      bn_util.bnToHex(
        toBn(),
        bitLength: bitLength,
        endian: endian,
        isNegative: isNegative,
        include0x: include0x,
      );

  Uint8List toU8a({
    int bitLength = -1,
    Endian endian = Endian.big,
    bool isNegative = false,
  }) =>
      bn_util.bnToU8a(
        toBn(),
        bitLength: bitLength,
        endian: endian,
        isNegative: isNegative,
      );

  BigInt bitNot({int? bitLength}) =>
      bn_util.bitnot(toBn(), bitLength: bitLength);

  static get max => 4294967296;
}
