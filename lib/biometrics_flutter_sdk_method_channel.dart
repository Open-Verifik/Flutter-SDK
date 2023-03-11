import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'biometrics_flutter_sdk_platform_interface.dart';

class MethodChannelBiometricsFlutterSdk extends BiometricsFlutterSdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'biometrics_flutter_sdk',
  );

  @override
  Future<String?> liveness() async {
    return await methodChannel.invokeMethod<String?>(
      'liveness',
    );
  }

  @override
  Future<String?> enroll({
    required String refId,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'enroll',
      {"refId": refId},
    );
  }

  @override
  Future<String?> authenticate({
    required String refId,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'authenticate',
      {'refId': refId},
    );
  }

  @override
  Future<String?> matchIDScan({
    required String refId,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'matchIDScan',
      {'refId': refId},
    );
  }

  @override
  Future<String?> photoIDScan() async {
    return await methodChannel.invokeMethod<String?>(
      'photoIDScan',
    );
  }

  @override
  Future<String?> appRegistrationKYC({
    required String phone,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'appRegistrationKYC',
      {'phone': phone},
    );
  }

  @override
  Future<String?> appLoginKYC({
    required String phone,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'appLoginKYC',
      {'phone': phone},
    );
  }

  @override
  Future<String?> appPhotoIDScanKYC({
    required String documentType,
  }) async {
    return await methodChannel.invokeMethod<String?>(
      'appPhotoIDScanKYC',
      {'documentType': documentType},
    );
  }
}
