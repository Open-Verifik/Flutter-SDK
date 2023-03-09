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
}
