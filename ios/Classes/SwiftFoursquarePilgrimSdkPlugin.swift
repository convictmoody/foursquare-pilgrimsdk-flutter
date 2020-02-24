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
//     let consumerKey = Bundle.main.object(forInfoDictionaryKey: "PILGRIM_CONSUMER_KEY") as? String
//     let secret = Bundle.main.object(forInfoDictionaryKey: "PILGRIM_SECRET") as? String

    PilgrimManager.shared().configure(
        withConsumerKey: "NYL5R1DDYA3QWP3RCW2XM4PSFRJ4TLB5JOFRX4ODHKP1ID1D",
        secret: "IE1LH4NO2KNNG1XSIQH3UZWOSOLRK31GT1ELMIZZYVXKWWNJ",
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
