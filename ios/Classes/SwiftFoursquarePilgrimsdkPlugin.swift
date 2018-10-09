import Flutter
import UIKit
    
public class SwiftFoursquarePilgrimSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "foursquare_pilgrimsdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFoursquarePilgrimSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
