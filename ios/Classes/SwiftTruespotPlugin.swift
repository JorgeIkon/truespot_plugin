import Flutter
import UIKit
import TSRTLS
import SwiftyJSON

public class SwiftTruespotPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "truespot", binaryMessenger: registrar.messenger())
    let instance = SwiftTruespotPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    switch call.method {
      case "configure":
        if let myArgs = call.arguments as? [String: Any]{
          if let appId = myArgs["appId"] as? String {}
          if let isDebugMode = myArgs["isDebugMode"] as? Bool {}
          result("senddata");
        }
        result("nodata");
        break
      case "getTrackingDevices":
        print("getTrackingDevices")
        TrueSpot.shared.getTrackingDevices { devices, error in
            let jsonData = try! JSONEncoder().encode(devices)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            result(jsonString)
        }
        break
      case "pair":
        if let myArgs = call.arguments as? [String: Any]{
          if let assetIdentifier = myArgs["assetIdentifier"] as? String{
            if let assetType = myArgs["assetType"] as? String {}
            if let tagId = myArgs["tagId"] as? String {
              let textResult: String = assetIdentifier;
              result(textResult);
            }
          }
        }
        result("nodata")
        break
      case "startScanning":
        let textResult: String = "";
        result(textResult);
        break
      case "stopScanning":
        let textResult: String = "";
        result(textResult);
        break
      case "launchTruedarMode":
        let textResult: String = "";
        result(textResult);
        break
      default:
        result(FlutterMethodNotImplemented)
    }
  }


}
