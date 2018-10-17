import 'dart:async';
import 'package:flutter/services.dart';

class FoursquarePilgrimSdk {
  static const MethodChannel _mc =
    const MethodChannel('foursquare_pilgrimsdk');

  static const EventChannel _ec =
    const EventChannel('foursquare_pilgrimsdk_visits');

  static start() {
    _mc.invokeMethod("start");
  }

  static stop() {
    _mc.invokeMethod("stop");
  }

  static clearAllData() {
    _mc.invokeMethod("clearAllData");
  }

  static fireTestVisit(String confidence, String type, bool isExit) {
    _mc.invokeMethod("fireTestVisit", <String, dynamic> {
      'confidence': confidence.toUpperCase(),
      'type': type.toUpperCase(),
      'isExit': isExit
    });
  }
  
  static sendConnectedTestVisit(String venueId, String confidence, String type, bool isExit) {
    _mc.invokeMethod("sendConnectedTestVisit", <String, dynamic> {
      'venueId': venueId,
      'confidence': confidence.toUpperCase(),
      'type': type.toUpperCase(),
      'isExit': isExit
    });
  }

  static Future<String> get debugInfo async {
    return await _mc.invokeMethod("getDebugInfo");
  }

  static Future<String> get installId async {
    return await _mc.invokeMethod("getInstallId");
  }

  static Future<bool> get isEnabled async {
    return await _mc.invokeMethod("isEnabled");
  }

  static Stream<dynamic> get visitStream {
    return _ec.receiveBroadcastStream();
  }
}
