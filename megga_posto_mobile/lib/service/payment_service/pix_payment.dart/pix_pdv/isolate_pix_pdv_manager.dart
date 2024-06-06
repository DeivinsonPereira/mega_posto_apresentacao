// ignore_for_file: unused_field

import 'dart:isolate';

import 'package:flutter/foundation.dart';

class IsolatePixPdvManager {
  Isolate? _isolate;
  ReceivePort? _receivePort;
  SendPort? _sendPort;
  ReceivePort? _responsePort;

  IsolatePixPdvManager._privateConstructor();

  static final IsolatePixPdvManager _instance =
      IsolatePixPdvManager._privateConstructor();

  static IsolatePixPdvManager get instance => _instance;

  void startVariables(Isolate isolate, ReceivePort receivePort,
      ReceivePort responsePort, SendPort sendPort) {
    _killCurrent();

    _isolate = isolate;
    _receivePort = receivePort;
    _responsePort = responsePort;
    _sendPort = sendPort;
  }

  void _killCurrent() {
    _isolate?.kill(priority: Isolate.immediate);
    _responsePort?.close();
    _receivePort?.close();
  }

  void kill() {
    _killCurrent();
    _isolate = null;
    _receivePort = null;
    _responsePort = null;
    _sendPort = null;
    if(kDebugMode) print('IsolatePixPdvManager killed');
  }
}
