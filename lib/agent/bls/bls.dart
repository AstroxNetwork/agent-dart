import 'dart:isolate';
import 'dart:typed_data';

import 'package:agent_dart/utils/extension.dart';
import 'ffi_base.dart';
import 'ffi_helper.dart';

Future<bool> blsInit() async {
  // ignore: unnecessary_null_comparison
  if (dylib == null) throw "ERROR: The library is not initialized 🙁";
  final response = ReceivePort();
  await Isolate.spawn(
    _isolateBlsInit,
    response.sendPort,
    onExit: response.sendPort,
  );
  final sendPort = await response.first as SendPort;
  final receivePort = ReceivePort();
  sendPort.send([receivePort.sendPort]);

  try {
    final result = await receivePort.first as bool;
    response.close();
    return result;
  } catch (e) {
    throw "Cannot initialize BLS instance :$e";
  }
}

void _isolateBlsInit(SendPort initialReplyTo) {
  final port = ReceivePort();

  initialReplyTo.send(port.sendPort);

  port.listen((message) async {
    try {
      final send = message.last as SendPort;
      send.send(rustBlsInit() == 1);
    } catch (e) {
      message.last.send(e);
    }
  });
}

Future<bool> blsVerify(
  Uint8List pk,
  Uint8List sig,
  Uint8List msg,
) async {
  // ignore: unnecessary_null_comparison
  if (dylib == null) throw "ERROR: The library is not initialized 🙁";
  if (await blsInit() != true) {
    throw "ERROR: Cannot initialize BLS instance";
  }
  final response = ReceivePort();
  await Isolate.spawn(
    _isolateBlsVerify,
    response.sendPort,
    onExit: response.sendPort,
  );
  final sendPort = await response.first as SendPort;
  final receivePort = ReceivePort();
  sendPort.send([
    sig.toHex(include0x: false),
    msg.toHex(include0x: false),
    pk.toHex(include0x: false),
    receivePort.sendPort
  ]);

  try {
    final result = await receivePort.first as bool;
    response.close();
    return result;
  } catch (e) {
    throw "Cannot verify bls_verify instance :$e";
  }
}

void _isolateBlsVerify(SendPort initialReplyTo) {
  final port = ReceivePort();

  initialReplyTo.send(port.sendPort);

  port.listen((message) async {
    try {
      final sig = message[0] as String;
      final msg = message[1] as String;
      final pk = message[2] as String;
      final send = message.last as SendPort;
      send.send(rustBlsVerify(sig.toUtf8(), msg.toUtf8(), pk.toUtf8()) == 1);
    } catch (e) {
      message.last.send(e);
    }
  });
}

String throwReturn(String message) {
  if (message.startsWith("Error:")) {
    throw message;
  } else {
    return message;
  }
}
