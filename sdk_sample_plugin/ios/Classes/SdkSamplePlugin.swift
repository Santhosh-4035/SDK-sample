import Flutter
import UIKit
import BolddeskSupportSDK

public class SdkSamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sdk_sample_plugin", binaryMessenger: registrar.messenger())
    let instance = SdkSamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "showHomeDashboard":
      BolddeskSDK.showHome()
      result(nil)
    case "handleNotification":
        if let args = call.arguments as? [String: Any] {
            BolddeskSDK.processRemoteNotification(userInfo: args)
            result(nil)
        } else {
            result(FlutterError(code: "INVALID_ARGUMENTS", message: "Expected notification data", details: nil))
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
