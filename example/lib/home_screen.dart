// ignore_for_file: avoid_print

import 'package:biometrics_flutter_sdk/biometrics_flutter_sdk.dart';
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
            // ElevatedButton(
            //   onPressed: () async {
            //     print(await _biometricsFlutterSdkPlugin.getPlatformVersion());
            //   },
            //   child: const Text(
            //     'Get version',
            //   ),
            // ),
            ElevatedButton(
              onPressed: () async {
                print(await _biometricsFlutterSdkPlugin.enroll('xxx'));
              },
              child: const Text(
                'Enroll',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await _biometricsFlutterSdkPlugin.authenticate('xxx'));
              },
              child: const Text(
                'Authenticate',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await _biometricsFlutterSdkPlugin.matchIDScan('xxx'));
              },
              child: const Text(
                'MatchIDScan',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await _biometricsFlutterSdkPlugin.photoIDScan());
              },
              child: const Text(
                'photoIDScan',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(await _biometricsFlutterSdkPlugin.appLoginKYC());
              },
              child: const Text(
                'AppLoginKYC',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
