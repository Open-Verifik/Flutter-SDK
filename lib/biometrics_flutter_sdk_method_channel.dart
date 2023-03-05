import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'biometrics_flutter_sdk_platform_interface.dart';

class MethodChannelBiometricsFlutterSdk extends BiometricsFlutterSdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'biometrics_flutter_sdk',
  );

  @override
  Future<String?> init() async {
    return await methodChannel.invokeMethod<String?>(
      'init',
    );
  }

  @override
  Future<String?> enroll(
    String refId,
  ) async {
    return await methodChannel.invokeMethod<String?>(
      'enroll',
      {"refId": refId},
    );
  }

  @override
  Future<String?> authenticate(
    String refId,
  ) async {
    return await methodChannel.invokeMethod<String?>(
      'authenticate',
      {'refId': refId},
    );
  }

  @override
  Future<String?> matchIDScan(
    String refId,
  ) async {
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
  Future<String?> appLoginKYC() async {
    return await methodChannel.invokeMethod<String?>(
      'appLoginKYC',
    );
  }
}
