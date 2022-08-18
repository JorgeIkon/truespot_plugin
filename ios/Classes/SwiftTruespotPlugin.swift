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
            if let tagId = myArgs["tagId"] as? String {
                let assetType = myArgs["assetType"] as? String
                TrueSpot.shared.pair(assetIdentifier: assetIdentifier, assetType: assetType!, tagId: tagId) { device, error in
                if error == nil {
                  result("Error");
                } else {
                  result("Paired");
                }
              };
            }
          }
        }
        result("nodata")
        break
      case "startScanning":
        TrueSpot.shared.startScanning();
        result("startScanning");
        break
      case "stopScanning":
        TrueSpot.shared.stopScanning();
        result("stopScanning");
        break
      case "launchTruedarMode":
        if let myArgs = call.arguments as? [String: Any]{
            let jsonString = myArgs["jsonDevice"] as? String ?? ""
            let data = Data(jsonString.utf8)
            let decoder = JSONDecoder()
            do {
                let device:TSDevice = try decoder.decode(TSDevice.self, from: data)
                if let vc = UIApplication.shared.delegate?.window??.rootViewController  as? FlutterViewController {
                    TrueSpot.shared.startScanning();
                    TrueSpot.shared.launchTruedarMode(from: vc, device: device)
                }
            } catch {
                print("Failed to decode JSON")
            }
        }
        break
      default:
        result(FlutterMethodNotImplemented)
    }
  }


}
