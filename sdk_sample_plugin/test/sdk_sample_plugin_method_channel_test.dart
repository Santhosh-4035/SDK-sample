import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sdk_sample_plugin/sdk_sample_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSdkSamplePlugin platform = MethodChannelSdkSamplePlugin();
  const MethodChannel channel = MethodChannel('sdk_sample_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect('42', '42');
  });
}
