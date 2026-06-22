sealed class Result<T, E extends Exception> {
  const Result();
}

final class Success<T, E extends Exception> {
  final T data;
  const Success(this.data);
}

final class Failure<T, E extends Exception> extends Result<T, E> {
  final E error;
  const Failure(this.error);
}