import 'package:dio/dio.dart';
import 'package:testly/config/base_response/base_response.dart';
import 'package:testly/core/constants/app_strings.dart';
import 'package:testly/features/auth/data/models/signup_response.dart';

abstract final class ApiErrorHandler {
  static ErrorResponse<SignupResponse> handleException(Exception exception) {
    if (exception is! DioException) {
      return ErrorResponse(AppStrings.generalErrorMessage);
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ErrorResponse(AppStrings.connectionErrorMessage);

      case DioExceptionType.connectionError:
        return ErrorResponse(AppStrings.noConnectionErrorMessage);

      case DioExceptionType.badCertificate:
        return ErrorResponse(AppStrings.securityErrorMessage);
      case DioExceptionType.cancel:
        return ErrorResponse(AppStrings.cancelErrorMessage);
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        if (exception.response != null) {
          return _handleStatusCode(exception.response!);
        }
        return ErrorResponse(AppStrings.generalErrorMessage);
      default:
        return ErrorResponse(AppStrings.generalErrorMessage);
    }
  }

  static ErrorResponse<SignupResponse> _handleStatusCode(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    String serverMessage = '';
    if (data is Map<String, dynamic>) {
      serverMessage = data['message'] ?? '';
    }

    switch (statusCode) {
      case 400:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code400Message;

      case 401:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code401Message;

      case 403:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code403Message;

      case 404:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code404Message;

      case 409:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code409Message;

      case 422:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code422Message;

      case 429:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code429Message;

      case 500:
      case 502:
      case 503:
      case 504:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.code500sMessage;

      default:
        serverMessage = serverMessage.isNotEmpty
            ? serverMessage
            : AppStrings.generalErrorMessage;
    }

    return ErrorResponse(serverMessage);
  }
}
