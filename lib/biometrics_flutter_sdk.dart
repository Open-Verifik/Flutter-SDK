import 'biometrics_flutter_sdk_platform_interface.dart';

class BiometricsFlutterSdk {
  Future<String?> init() async {
    return await BiometricsFlutterSdkPlatform.instance.init();
  }

  Future<String?> enroll(
    String refId,
  ) async {
    return await BiometricsFlutterSdkPlatform.instance.enroll(
      refId,
    );
  }

  Future<String?> authenticate(
    String refId,
  ) async {
    return await BiometricsFlutterSdkPlatform.instance.authenticate(
      refId,
    );
  }

  Future<String?> matchIDScan(
    String refId,
  ) async {
    return await BiometricsFlutterSdkPlatform.instance.matchIDScan(
      refId,
    );
  }

  Future<String?> photoIDScan() async {
    return await BiometricsFlutterSdkPlatform.instance.photoIDScan();
  }

  Future<String?> appLoginKYC() async {
    return await BiometricsFlutterSdkPlatform.instance.appLoginKYC();
  }
}
