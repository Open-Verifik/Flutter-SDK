import 'biometrics_flutter_sdk_platform_interface.dart';
import 'biometrics_flutter_sdk_response.dart';

class BiometricsFlutterSdk {
  Future<BiometricsResponse> init() async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.init(),
    );
  }

  Future<BiometricsResponse> enroll(
    String refId,
  ) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.enroll(
        refId,
      ),
    );
  }

  Future<BiometricsResponse> authenticate(
    String refId,
  ) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.authenticate(
        refId,
      ),
    );
  }

  Future<BiometricsResponse> matchIDScan(
    String refId,
  ) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.matchIDScan(
        refId,
      ),
    );
  }

  Future<BiometricsResponse> photoIDScan() async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.photoIDScan(),
    );
  }

  Future<BiometricsResponse> appLoginKYC() async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.appLoginKYC(),
    );
  }

  BiometricsResponse _checkResponse(String? response) {
    print('sdk = $response');
    switch (response) {
      case 'Init':
        return BiometricsResponse(
          type: BiometricsResponseType.initial,
          message: 'VerifikKit Flutter SDK Inicializado',
        );
      case 'User cancel enrollment or there was a connection error':
      case 'User cancel authentication or there was a connection error':
      case 'User cancel ID Scan or there was a connection error - ID Step':
        return BiometricsResponse(
          type: BiometricsResponseType.cancelled,
          message: response!,
        );
      case 'There was an error parsing enrollment resulting data, please contact Verifik Support Team':
        return BiometricsResponse(
          type: BiometricsResponseType.error,
          message: response!,
        );
      default:
        return BiometricsResponse(
          type: BiometricsResponseType.unknown,
          message: 'BiometricsResponse unknown: $response',
        );
    }
  }
}
