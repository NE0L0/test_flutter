class InvalidDataException implements Exception {
  InvalidDataException({required this.dataKey, required this.message});
  final dynamic dataKey;
  final String message;

  void printMessage() => print(toString());

  @override
  String toString() => 'Invalid Data Exception: $message';
}
