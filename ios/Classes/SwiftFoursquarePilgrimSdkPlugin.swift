import Flutter
import UIKit
import Pilgrim

public class SwiftFoursquarePilgrimSdkPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let fmc = FlutterMethodChannel(name: "foursquare_pilgrimsdk", binaryMessenger: registrar.messenger())
    let fec = FlutterEventChannel(name: "foursquare_pilgrimsdk_visits", binaryMessenger: registrar.messenger())
    let instance = SwiftFoursquarePilgrimSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: fmc)
    fec.setStreamHandler(instance)
    
    PilgrimManager.shared().configure(
        withConsumerKey: "",
        secret: "",
        delegate: instance,
        completion: nil)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch(call.method) {
    case "start":
      PilgrimManager.shared().start()
    case "stop":
      PilgrimManager.shared().stop()
    case "clearAllData":
      PilgrimManager.shared().clearAllData()
    case "fireTestVisit":
      result(FlutterMethodNotImplemented)
    case "sendConnectedTestVisit":
      result(FlutterMethodNotImplemented)
    case "getDebugInfo":
      result(PilgrimManager.shared().debugLogs())
    case "getInstallId":
      result(PilgrimManager.shared().installId)
    case "isEnabled":
      result(PilgrimManager.shared().canEnable())
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

extension SwiftFoursquarePilgrimSdkPlugin: PilgrimManagerDelegate {
  public func pilgrimManager(_ pilgrimManager: PilgrimManager, handle visit: Visit) {
    // Send visit to EventSink
  }
}
