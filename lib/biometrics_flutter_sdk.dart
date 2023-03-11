import 'package:flutter/foundation.dart';

import 'biometrics_flutter_sdk_platform_interface.dart';
import 'biometrics_flutter_sdk_response.dart';

class BiometricsFlutterSdk {
  Future<BiometricsResponse> liveness() async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.liveness(),
    );
  }

  Future<BiometricsResponse> enroll({
    required String refId,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.enroll(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> authenticate({
    required String refId,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.authenticate(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> matchIDScan({
    required String refId,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.matchIDScan(
        refId: refId,
      ),
    );
  }

  Future<BiometricsResponse> photoIDScan() async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.photoIDScan(),
    );
  }

  Future<BiometricsResponse> appRegistrationKYC({
    required String phone,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.appRegistrationKYC(
        phone: phone,
      ),
    );
  }

  Future<BiometricsResponse> appLoginKYC({
    required String phone,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.appLoginKYC(
        phone: phone,
      ),
    );
  }

  Future<BiometricsResponse> appPhotoIDScanKYC({
    required String documentType,
  }) async {
    return _checkResponse(
      await BiometricsFlutterSdkPlatform.instance.appPhotoIDScanKYC(
        documentType: documentType,
      ),
    );
  }

  BiometricsResponse _checkResponse(String? response) {
    if (kDebugMode) {
      print('sdk = $response');
    }
    switch (response) {
      case 'Init':
        return BiometricsResponse(
          type: BiometricsResponseType.initial,
          message: 'VerifikKit Flutter SDK Inicializado',
        );
      case 'User cancel enrollment or there was a connection error':
      case 'User cancel authentication or there was a connection error':
      case 'User cancel Photo ID Scan or there was a connection error':
      case 'User cancel ID Scan or there was a connection error - ID Step':
      case 'User cancel App Register or there was a connection error':
      case 'User cancel App Login or there was a connection error':
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
