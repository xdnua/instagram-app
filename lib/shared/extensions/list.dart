extension ListExtension<T> on List<T> {
  /// Toggle value in list
  List<T> toggleValue(T value) {
    final list = [...this];
    if (contains(value)) {
      list.removeWhere((element) => element == value);
      return list;
    } else {
      return [...list, value];
    }
  }
}
