extension GeneralListExtensions <T> on List<T> {
  T? tryFindFirst(bool Function(T item) comparator) {
    try{
      final item = firstWhere(comparator);
      return item;
    } catch(error) {
      return null;
    }
  }
}
