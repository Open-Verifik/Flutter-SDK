import 'package:flutter/material.dart';

enum BiometricsResponseType {
  initial,
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

  displaySnackBar(
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
        backgroundColor: type == BiometricsResponseType.initial ||
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
