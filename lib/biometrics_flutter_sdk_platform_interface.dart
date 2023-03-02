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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError(
      'platformVersion() has not been implemented.',
    );
  }

  Future<String?> enroll(
    String refId,
  ) {
    throw UnimplementedError(
      'enroll() has not been implemented.',
    );
  }

  Future<String?> authenticate(
    String refId,
  ) {
    throw UnimplementedError(
      'authenticate() has not been implemented.',
    );
  }

  Future<String?> matchIDScan(
    String refId,
  ) {
    throw UnimplementedError(
      'matchIDScan() has not been implemented.',
    );
  }

  Future<String?> photoIDScan() {
    throw UnimplementedError(
      'photoIDScan() has not been implemented.',
    );
  }

  Future<String?> appLoginKYC() {
    throw UnimplementedError(
      'appLoginKYC() has not been implemented.',
    );
  }
}
