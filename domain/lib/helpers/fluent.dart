extension Linq<T> on Iterable<T> {
  void iteri(void Function(int index, T value) action) {
    var i = 0;
    for (final element in this) {
      action(i++, element);
    }
  }

  Iterable<U> mapi<U>(U Function(int index, T value) mapper) {
    final result = <U>[];
    var i = 0;
    for (final element in this) {
      result.add(mapper(i++, element));
    }
    return result;
  }
}

extension FluentExt<T> on T {
  T let(T Function(T) action) {
    return action(this);
  }

  U so<U>(U Function(T) action) {
    return action(this);
  }
}
