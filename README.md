# biometrics_flutter_sdk

> **DEPRECATED** — This plugin bundles legacy **FaceTec SDK** binaries (via `VerifikKit`). Verifik no longer uses FaceTec as a vendor. **Do not start new integrations with this package.** See [DEPRECATION.md](DEPRECATION.md) for migration paths.

A Flutter plugin wrapping the legacy VerifikKit native SDK for iOS and Android biometric flows (liveness, enrollment, authentication, ID scan, KYC).

## Status

| Item | Detail |
|------|--------|
| Last update | July 2023 |
| FaceTec in repo | Yes — vendored binaries only (no Dart-level FaceTec API) |
| Maintained | No |
| Replacement | [Verifik REST Biometrics v2](https://docs.verifik.co/biometrics/liveness/) or [web-sdk SmartEnroll](https://github.com/Open-Verifik/web-sdk) |

## FaceTec artifacts shipped

- `ios/FaceTecSDK.framework` (~30 MB)
- `ios/VerifikKit.xcframework` (embeds FaceTecSDK, ~42 MB)
- `example/android/libs/facetec-sdk-9.6.24.aar` (~6.4 MB, example app only)

These binaries are **not safe to delete** in the current major without breaking link-time dependencies for existing consumers.

## Migration

See [DEPRECATION.md](DEPRECATION.md) for full migration guidance to Verifik REST APIs and SmartEnroll.

## Getting Started (legacy)

This project is a Flutter [plug-in package](https://flutter.dev/developing-packages/).

For help getting started with Flutter development, view the [online documentation](https://flutter.dev/docs).
