class ErrorBundle implements Exception
{
  List<Object> errors;
  ErrorBundle(this.errors);

  @override
  String toString() {
    return errors.toString();
  }
}
