import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum BiometricsResponseType {
  notInitialized,
  initialized,
  success,
  error,
  cancelled,
  unknown,
}

class BiometricsResponse {
  final BiometricsResponseType type;
  final String message;

  BiometricsResponse({
    required this.type,
    required this.message,
  });

  factory BiometricsResponse.fromSDK(
    String? response,
  ) {
    if (kDebugMode) {
      print('sdk = $response');
    }
    switch (response) {
      case 'initialized':
        return BiometricsResponse(
          type: BiometricsResponseType.initialized,
          message: 'VerifikKit Flutter SDK Inicializado',
        );
      case 'User cancel enrollment or there was a connection error':
      case 'User cancel authentication or there was a connection error':
      case 'User cancel Photo ID Scan or there was a connection error':
      case 'User cancel ID Scan or there was a connection error - ID Step':
      case 'User cancel App Register or there was a connection error':
      case 'User cancel App Login or there was a connection error':
        return BiometricsResponse(
          type: BiometricsResponseType.cancelled,
          message: response!,
        );
      case 'User not found on Database':
      case 'There was an error parsing app register resulting data, please contact Verifik Support Team':
      case 'There was an error parsing enrollment resulting data, please contact Verifik Support Team':
        return BiometricsResponse(
          type: BiometricsResponseType.error,
          message: response!,
        );
      default:
        return BiometricsResponse(
          type: BiometricsResponseType.unknown,
          message: 'BiometricsResponse unknown: $response',
        );
    }
  }

  void displaySnackBar(
    BuildContext context,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: type == BiometricsResponseType.cancelled
                ? Colors.black
                : Colors.white,
          ),
        ),
        backgroundColor: type == BiometricsResponseType.initialized ||
                type == BiometricsResponseType.success
            ? Colors.green
            : type == BiometricsResponseType.error
                ? Colors.red
                : type == BiometricsResponseType.cancelled
                    ? Colors.yellow
                    : Colors.black,
      ),
    );
  }
}
