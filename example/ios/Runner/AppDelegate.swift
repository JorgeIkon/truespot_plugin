import UIKit
import Flutter
import TSRTLS

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let secret = "x8KKW+fIrgikKASLL0CxzqmxAbG9iz6ZUe32bRq+6UYszf8PuWQoa9jQaTY+gLla"
      let tenantId = "61f1a540b93b7b4a0ccb2ea1"
      
      TrueSpot.configure(tenatId: tenantId, clientSecret: secret, isDebugMode: true)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
