sealed class BaseResponse<T> {}

class SuccessResponse<T> extends BaseResponse<T> {
  final T? data;

  SuccessResponse(this.data);
}

class ErrorResponse<T> extends BaseResponse<T> {
  final Exception error;

  ErrorResponse(this.error);
}
