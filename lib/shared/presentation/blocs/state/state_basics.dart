class ValueError <V, E>
{
  final V value;
  final E? error;

  const ValueError({required this.value, this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueError &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          error == other.error);

  @override
  int get hashCode => value.hashCode ^ error.hashCode;

  @override
  String toString() => 'ValueError{ value: $value, error: $error,}';

  ValueError<V, E> copyWith({V? value, E? error}) => ValueError<V, E>(
    value: value ?? this.value,
    error: error ?? this.error,
  );
}
