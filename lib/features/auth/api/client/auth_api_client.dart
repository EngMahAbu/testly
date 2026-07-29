
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:testly/core/constants/endpoints.dart';
import 'package:testly/features/auth/data/models/login_request.dart';
import 'package:testly/features/auth/data/models/login_response.dart';

part 'auth_api_client.g.dart';

@singleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;
  
  @POST(Endpoints.signIn)
  Future<LoginResponse> login(@Body() LoginRequest request);
   
}

 
