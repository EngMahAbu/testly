import 'package:dio/dio.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/core/constants/app_strings.dart';


abstract final class ApiErrorHandler {

  static ErrorResponse<T> handleException<T>(
      Exception exception) {

    if (exception is! DioException) {
      return ErrorResponse(
        AppStrings.generalErrorMessage,
      );
    }

    switch (exception.type) {

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:

        return ErrorResponse(
          AppStrings.connectionErrorMessage,
        );

      case DioExceptionType.connectionError:

        return ErrorResponse(
          AppStrings.noConnectionErrorMessage,
        );

      default:

        return ErrorResponse(
          AppStrings.generalErrorMessage,
        );
    }
  }
}