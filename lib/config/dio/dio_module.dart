import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/core/constants/endpoints.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      transformTimeout: Duration(seconds: 10),
    ),
  );
}
