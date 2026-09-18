import 'dart:developer' as developer;

/// FaceTec-backed VerifikKit is deprecated. See DEPRECATION.md in the repo root.
const String kBiometricsFlutterSdkDeprecationMessage =
    'biometrics_flutter_sdk is deprecated: it bundles legacy FaceTec binaries '
    'via VerifikKit. Verifik no longer uses FaceTec. '
    'Migrate to Verifik REST liveness APIs or web-sdk SmartEnroll. '
    'See DEPRECATION.md.';

bool _deprecationLogged = false;

void logBiometricsFlutterSdkDeprecation() {
  if (_deprecationLogged) return;
  _deprecationLogged = true;
  developer.log(
    kBiometricsFlutterSdkDeprecationMessage,
    name: 'biometrics_flutter_sdk',
    level: 900, // warning
  );
}
