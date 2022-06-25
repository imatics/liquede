extension ListExtension<T> on List<T>? {
  int get count {
    if (this == null) {
      return 0;
    } else {
      return this!.length;
    }
  }

  bool get hasNothing {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }
}
