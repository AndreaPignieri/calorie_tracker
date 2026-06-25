sealed class Result<T, E extends Exception> {
  const Result();
  factory Result.success(T data) = Success<T, E>;
  factory Result.failure(E error) = Failure<T ,E>;
}

final class Success<T, E extends Exception> extends Result<T, E> {
  final T data;
  const Success(this.data);
}

final class Failure<T, E extends Exception> extends Result<T, E> {
  final E error;
  const Failure(this.error);
}