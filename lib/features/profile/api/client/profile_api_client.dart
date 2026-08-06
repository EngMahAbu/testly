import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'profile_api_client.g.dart';

@singleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  // @POST(Endpoints.signIn)
  // Future<LoginResponse> login(@Body() LoginRequest request);
}
