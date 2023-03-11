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
                    phone: 'xxx',
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
                    phone: 'xxx',
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
                    documentType: 'xxx',
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

  _displayMessage(BiometricsResponse biometricsResponse) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          biometricsResponse.message,
          style: TextStyle(
            color: biometricsResponse.type == BiometricsResponseType.cancelled
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: biometricsResponse.type ==
                    BiometricsResponseType.initial ||
                biometricsResponse.type == BiometricsResponseType.success
            ? Colors.green
            : biometricsResponse.type == BiometricsResponseType.error
                ? Colors.red
                : biometricsResponse.type == BiometricsResponseType.cancelled
                    ? Colors.yellow
                    : Colors.black,
      ),
    );
  }
}
