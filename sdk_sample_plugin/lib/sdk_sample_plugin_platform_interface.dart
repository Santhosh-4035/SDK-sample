import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sdk_sample_plugin_method_channel.dart';

abstract class SdkSamplePluginPlatform extends PlatformInterface {
  /// Constructs a SdkSamplePluginPlatform.
  SdkSamplePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SdkSamplePluginPlatform _instance = MethodChannelSdkSamplePlugin();

  /// The default instance of [SdkSamplePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSdkSamplePlugin].
  static SdkSamplePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SdkSamplePluginPlatform] when
  /// they register themselves.
  static set instance(SdkSamplePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showHome() {
    throw UnimplementedError('showHome() has not been implemented.');
  }

  Future<void> showNotification(
    Map<String, dynamic> body,
    String notificationIcon,
  );
}
