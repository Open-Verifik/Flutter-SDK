import 'package:flutter_test/flutter_test.dart';
import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk.dart';
import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk_platform_interface.dart';
import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBiometricsFlutterSdkPlatform
    with MockPlatformInterfaceMixin
    implements BiometricsFlutterSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> appLoginKYC() {
    throw UnimplementedError();
  }

  @override
  Future<String?> authenticate(
    String refId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<String?> enroll(
    String refId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<String?> matchIDScan(
    String refId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<String?> photoIDScan() {
    throw UnimplementedError();
  }
}

void main() {
  final BiometricsFlutterSdkPlatform initialPlatform =
      BiometricsFlutterSdkPlatform.instance;

  test('$MethodChannelBiometricsFlutterSdk is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelBiometricsFlutterSdk>(),
    );
  });

  test('getPlatformVersion', () async {
    BiometricsFlutterSdk biometricsFlutterSdkPlugin = BiometricsFlutterSdk();
    MockBiometricsFlutterSdkPlatform fakePlatform =
        MockBiometricsFlutterSdkPlatform();
    BiometricsFlutterSdkPlatform.instance = fakePlatform;

    expect(
      await biometricsFlutterSdkPlugin.getPlatformVersion(),
      '42',
    );
  });
}
