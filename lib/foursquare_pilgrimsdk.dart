import 'dart:async';
import 'package:flutter/services.dart';

class FoursquarePilgrimSdk {
  static const MethodChannel _channel =
      const MethodChannel('foursquare_pilgrimsdk');

  static start() {
    _channel.invokeMethod("start");
  }

  static stop() {
    _channel.invokeMethod("stop");
  }

  static fireTestVisit() {
    _channel.invokeMethod("fireTestVisit");
  }

  static Future<String> get installId async {
    return await _channel.invokeMethod("getInstallId");
  }

  static dynamic get isEnabled async {
    return await _channel.invokeMethod("isEnabled");
  }
}
