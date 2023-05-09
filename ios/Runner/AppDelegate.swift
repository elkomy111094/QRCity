import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     GMSServices.provideAPIKey("AIzaSyC23Z8w530JaT7b2kWgF-SV0PnqE80UK94")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
