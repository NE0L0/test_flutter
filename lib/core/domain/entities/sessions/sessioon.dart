class Session {
  final String token;

  Session({required this.token});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          runtimeType == other.runtimeType &&
          token == other.token);

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'Session{ token: $token,}';

  Session copyWith({String? token}) => Session(
    token: token ?? this.token,
  );
}
