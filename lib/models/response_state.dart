abstract class ResponseState<T> {}

class Initial<T> extends ResponseState<T> {}
class Loading<T> extends ResponseState<T> {}
class Success<T> extends ResponseState<T> {
  T data;
  Success({required this.data});
}
class Failure<T> extends ResponseState<T> {
  Exception exception;
  Failure({required this.exception});
}