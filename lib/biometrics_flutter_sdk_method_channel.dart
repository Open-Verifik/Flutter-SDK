import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'biometrics_flutter_sdk_platform_interface.dart';

class MethodChannelBiometricsFlutterSdk extends BiometricsFlutterSdkPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'biometrics_flutter_sdk',
  );

  @override
  Future<String?> getPlatformVersion() async {
    return await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
  }

  @override
  Future<String?> enroll(
    String refId,
  ) async {
    return await methodChannel.invokeMethod<String>(
      'enroll',
    );
  }

  @override
  Future<String?> authenticate(
    String refId,
  ) async {
    return await methodChannel.invokeMethod<String>(
      'authenticate',
    );
  }

  @override
  Future<String?> matchIDScan(
    String refId,
  ) async {
    return await methodChannel.invokeMethod<String>(
      'matchIDScan',
    );
  }

  @override
  Future<String?> photoIDScan() async {
    return await methodChannel.invokeMethod<String>(
      'photoIDScan',
    );
  }

  @override
  Future<String?> appLoginKYC() async {
    return await methodChannel.invokeMethod<String>(
      'appLoginKYC',
    );
  }
}
