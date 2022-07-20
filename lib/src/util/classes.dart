class Wrapped<T> {
  const Wrapped(this.value);
  final T value;
}

class WrappedMut<T> {
  WrappedMut(this.value);
  T value;
}
