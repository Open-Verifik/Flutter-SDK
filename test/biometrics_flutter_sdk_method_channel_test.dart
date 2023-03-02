import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk_method_channel.dart';

void main() {
  MethodChannelBiometricsFlutterSdk platform = MethodChannelBiometricsFlutterSdk();
  const MethodChannel channel = MethodChannel('biometrics_flutter_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
