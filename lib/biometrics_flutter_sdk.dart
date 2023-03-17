import 'biometrics_flutter_sdk_platform_interface.dart';
import 'biometrics_flutter_sdk_response.dart';

class BiometricsFlutterSdk {
  Future<BiometricsResponse> init({
    required String token,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.init(
        token: token,
      ),
    );
  }

  Future<BiometricsResponse> liveness() async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.liveness(),
    );
  }

  Future<BiometricsResponse> enroll({
    required String refId,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.enroll(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> authenticate({
    required String refId,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.authenticate(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> matchIDScan({
    required String refId,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.matchIDScan(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> photoIDScan() async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.photoIDScan(),
    );
  }

  Future<BiometricsResponse> appRegistrationKYC({
    required String phone,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.appRegistrationKYC(
        phone: phone,
      ),
    );
  }

  Future<BiometricsResponse> appLoginKYC({
    required String phone,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.appLoginKYC(
        phone: phone,
      ),
    );
  }

  Future<BiometricsResponse> appPhotoIDScanKYC({
    required String documentType,
  }) async {
    return BiometricsResponse.fromSDK(
      await BiometricsFlutterSdkPlatform.instance.appPhotoIDScanKYC(
        documentType: documentType,
      ),
    );
  }
}
