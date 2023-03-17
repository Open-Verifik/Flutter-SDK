// ignore_for_file: avoid_print

import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk.dart';
import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk_response.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _biometricsFlutterSdkPlugin = BiometricsFlutterSdk();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Biometrics Flutter SDK',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.init(
                    token:
                        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcHBSZWdpc3RyYXRpb25JZCI6IjY0MTIyZGQ4NjVjYjkwNzAyZjFhNDgwMiIsImV4cGlyZXNBdCI6IjIwMjMtMDMtMTYgMTQ6MDU6NTciLCJhY2Nlc3NUeXBlIjoiYXBwX3JlZ2lzdHJhdGlvbl9jcmVhdGVkIiwiZW1haWwiOiJzYW50aWFnb2dhbGVhbm9ncmFuZGV0aEBnbWFpbC5jb20iLCJwaG9uZSI6IjMwMTMwNzgyNzMiLCJpYXQiOjE2Nzg5NzM3NTd9.q-YWowBD6Xtx79Bjq8eufv1_zgIIDk7Gcnao5hcvBPw',
                  ),
                );
              },
              child: const Text(
                'Init',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.liveness(),
                );
              },
              child: const Text(
                'Liveness',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.enroll(
                    refId: 'xxx',
                  ),
                );
              },
              child: const Text(
                'Enroll',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.authenticate(
                    refId: 'xxx',
                  ),
                );
              },
              child: const Text(
                'Authenticate',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.matchIDScan(
                    refId: 'xxx',
                  ),
                );
              },
              child: const Text(
                'MatchIDScan',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.photoIDScan(),
                );
              },
              child: const Text(
                'photoIDScan',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.appRegistrationKYC(
                    phone: '3000000001',
                  ),
                );
              },
              child: const Text(
                'appRegistrationKYC',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.appLoginKYC(
                    phone: '3000000001',
                  ),
                );
              },
              child: const Text(
                'AppLoginKYC',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _displayMessage(
                  await _biometricsFlutterSdkPlugin.appPhotoIDScanKYC(
                    documentType: 'cc',
                  ),
                );
              },
              child: const Text(
                'appPhotoIDScanKYC',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayMessage(
    BiometricsResponse biometricsResponse,
  ) {
    if (context.mounted) biometricsResponse.displaySnackBar(context);
  }
}
