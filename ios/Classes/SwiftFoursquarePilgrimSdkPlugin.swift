import Flutter
import UIKit
    
public class SwiftFoursquarePilgrimSdkPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let fmc = FlutterMethodChannel(name: "foursquare_pilgrimsdk", binaryMessenger: registrar.messenger())
    let fec = FlutterEventChannel(name: "foursquare_pilgrimsdk_visits", binaryMessenger: registrar.messenger())
    let instance = SwiftFoursquarePilgrimSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: fmc)
    fec.setStreamHandler(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch(call.method) {
    case "start":
      result(FlutterMethodNotImplemented)
    case "stop":
      result(FlutterMethodNotImplemented)
    case "clearAllData":
      result(FlutterMethodNotImplemented)
    case "fireTestVisit":
      result(FlutterMethodNotImplemented)
    case "sendConnectedTestVisit":
      result(FlutterMethodNotImplemented)
    case "getDebugInfo":
      result(FlutterMethodNotImplemented)
    case "getInstallId":
      result(FlutterMethodNotImplemented)
    case "isEnabled":
      result(FlutterMethodNotImplemented)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    eventSink = events
    return nil
  }
    
  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    return nil
  }
}

