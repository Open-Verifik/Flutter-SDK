# FaceTec SDK Deprecation Notice

> **Status:** Deprecated — last meaningful update July 2023  
> **Effective:** This repository is no longer maintained for new integrations.

Verifik **no longer uses FaceTec** as a biometrics vendor. This Flutter plugin still ships legacy FaceTec binaries bundled inside `VerifikKit` and as standalone vendored artifacts. Those binaries are retained only so existing apps on old major versions do not break at link time.

## FaceTec artifacts in this repository

| Artifact | Location | Size (approx.) | Safe to delete? |
|----------|----------|----------------|-----------------|
| `FaceTecSDK.framework` | `ios/FaceTecSDK.framework` | ~30 MB | **No** — required by `biometrics_flutter_sdk.podspec` linker flags for current consumers |
| Embedded `FaceTecSDK.framework` | `ios/VerifikKit.xcframework/**/Frameworks/FaceTecSDK.framework` | (inside 42 MB xcframework) | **No** — `VerifikKit` runtime depends on it |
| `facetec-sdk-9.6.24.aar` | `example/android/libs/facetec-sdk-9.6.24.aar` | ~6.4 MB | **No** — referenced by `example/android/app/build.gradle` |

The Dart/Swift/Java plugin code does **not** import FaceTec APIs directly; all biometric flows go through the legacy `VerifikKit` wrapper, which internally calls FaceTec session processors.

## Do not use for new projects

- No FaceTec session server is operated by Verifik anymore.
- FaceTec license terms prohibit redistribution without an active vendor agreement.
- SmartEnroll and current Verifik biometric flows use Verifik's own liveness stack (OpenCV-based PAD, REST APIs), not FaceTec 3D FaceMaps.

## Migration paths

### Web / SmartEnroll (recommended for new integrations)

Use the maintained [Open-Verifik/web-sdk](https://github.com/Open-Verifik/web-sdk) (`access.verifik.co` branch). SmartEnroll liveness runs in-browser via camera capture + Verifik REST APIs — no FaceTec Device SDK required.

Relevant modules:

- `src/app/modules/auth/smart-enroll/smart-liveness/`
- `src/app/modules/auth/smart-enroll/smart-scanner/`

### Mobile — REST API integration (recommended)

Replace the native FaceTec/VerifikKit flow with direct calls to Verifik Biometrics v2:

| Legacy SDK method | Verifik v2 replacement |
|-----------------|------------------------|
| `liveness()` | [`POST /v2/face-recognition/liveness`](https://docs.verifik.co/biometrics/liveness/) |
| `enroll()` / `authenticate()` | [`POST /v2/face-recognition/enroll`](https://docs.verifik.co/biometrics/) + [`/validate`](https://docs.verifik.co/biometrics/) |
| `matchIDScan()` / `photoIDScan()` | [`POST /v2/face-recognition/compare-live`](https://docs.verifik.co/biometrics/compare-live/) + document scan APIs |
| KYC flows (`appRegistrationKYC`, etc.) | [SmartEnroll](https://docs.verifik.co/) project APIs |

Capture a camera frame in Flutter (`camera` package), base64-encode it, and POST to the REST endpoint with your Verifik bearer token.

### Mobile — native SDK (if you must stay native)

The source-of-truth for native FaceTec integration code is [Open-Verifik/IOS-SDK](https://github.com/Open-Verifik/IOS-SDK) (`verifik-customization` branch). That repo contains the Swift processors (`VerifikLivenessProcessor`, `VerifikEnrollmentProcessor`, etc.) that call `FaceTec.sdk` directly. **It also needs deprecation/removal work** — see follow-up PRs.

[Open-Verifik/react-native-sdk](https://github.com/Open-Verifik/react-native-sdk) is a thin wrapper around the same vendored `VerifikKit.xcframework` + `FaceTecSDK.framework` pattern as this repo.

## Timeline

| Phase | Action |
|-------|--------|
| **Now** | Mark repo deprecated; document migration (this file) |
| **Next** | Deprecate IOS-SDK source integration; publish FaceTec-free `VerifikKit` xcframework |
| **Future major** | Remove vendored FaceTec binaries from all Open-Verifik mobile SDK repos |

## Questions

Contact Verifik support or open an issue in the relevant Open-Verifik repository.
