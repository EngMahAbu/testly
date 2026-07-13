import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/config/storage_module/storage.dart';
import 'package:testly/config/dio/token_service.dart';
import 'package:testly/core/constants/endpoints.dart';

@module
abstract class DioModule {
  @singleton
  TokenService tokenService(SecureStorageService secureStorageService) =>
      TokenService(secureStorageService);

  @singleton
  Dio dio(SecureStorageService secureStorageService, TokenService tokenService) {
    final _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        
      ),
    );

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          final token = await tokenService.getToken();
          if (token != null && options.headers['token'] == null) {
            options.headers['token'] = token;
          }
        } catch (_) {}
        return handler.next(options);
      },
    ));

    return _dio;
  }

  @singleton
  SecureStorageService get secureStorageService => SecureStorageService();
}

 