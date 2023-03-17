import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'biometrics_flutter_sdk_method_channel.dart';

abstract class BiometricsFlutterSdkPlatform extends PlatformInterface {
  BiometricsFlutterSdkPlatform()
      : super(
          token: _token,
        );

  static final Object _token = Object();

  static BiometricsFlutterSdkPlatform _instance =
      MethodChannelBiometricsFlutterSdk();

  static BiometricsFlutterSdkPlatform get instance => _instance;

  static set instance(
    BiometricsFlutterSdkPlatform instance,
  ) {
    PlatformInterface.verifyToken(
      instance,
      _token,
    );
    _instance = instance;
  }

  Future<String?> init({
    required String token,
  }) {
    throw UnimplementedError(
      'init() has not been implemented.',
    );
  }

  Future<String?> liveness() {
    throw UnimplementedError(
      'liveness() has not been implemented.',
    );
  }

  Future<String?> enroll({
    required String refId,
  }) {
    throw UnimplementedError(
      'enroll() has not been implemented.',
    );
  }

  Future<String?> authenticate({
    required String refId,
  }) {
    throw UnimplementedError(
      'authenticate() has not been implemented.',
    );
  }

  Future<String?> matchIDScan({
    required String refId,
  }) {
    throw UnimplementedError(
      'matchIDScan() has not been implemented.',
    );
  }

  Future<String?> photoIDScan() {
    throw UnimplementedError(
      'photoIDScan() has not been implemented.',
    );
  }

  Future<String?> appRegistrationKYC({
    required String phone,
  }) {
    throw UnimplementedError(
      'appRegistrationKYC() has not been implemented.',
    );
  }

  Future<String?> appLoginKYC({
    required String phone,
  }) {
    throw UnimplementedError(
      'appLoginKYC() has not been implemented.',
    );
  }

  Future<String?> appPhotoIDScanKYC({
    required String documentType,
  }) {
    throw UnimplementedError(
      'appPhotoIDScanKYC() has not been implemented.',
    );
  }
}
