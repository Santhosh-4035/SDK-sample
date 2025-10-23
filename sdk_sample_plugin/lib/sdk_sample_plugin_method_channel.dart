import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sdk_sample_plugin_platform_interface.dart';

/// An implementation of [SdkSamplePluginPlatform] that uses method channels.
class MethodChannelSdkSamplePlugin extends SdkSamplePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sdk_sample_plugin');

  @override
  Future<void> showHome() async {
    await methodChannel.invokeMethod('showHomeDashboard');
  }

  @override
  Future<void> showNotification(Map<String, dynamic> body, String icon) async {
    await methodChannel.invokeMethod('showNotification', {
      'body': body,
      'icon': icon,
    });
  }
  
  @override
  Future<void> handleNotification(Map<String, dynamic> data) async {
    await methodChannel.invokeMethod('handleNotification', data);
  }
}
