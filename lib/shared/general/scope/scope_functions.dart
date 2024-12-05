extension ScopeFunctions <T extends Object> on T
{
  R let<R> (R Function(T) block) => block(this);
  T? takeIf(bool Function(T) block) {
    if(block(this)) {
      return this;
    }
    else {
      return null;
    }
  }
}
