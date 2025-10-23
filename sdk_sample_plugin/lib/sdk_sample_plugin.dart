
import 'sdk_sample_plugin_platform_interface.dart';

class SdkSamplePlugin {
  static Future<void> showHome() {
    return SdkSamplePluginPlatform.instance.showHome();
  }

  static Future<void> showNotification(Map<String, dynamic> body, String notificationIcon) {
    return SdkSamplePluginPlatform.instance.showNotification(body, notificationIcon);
  }

  static Future<void> handleNotification(Map<String, dynamic> data) async {
    await SdkSamplePluginPlatform.instance.handleNotification(data);
  }
}
