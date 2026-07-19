import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/config/dio/token_service.dart';
import 'package:testly/features/splash/presentation/view_models/splash_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class SplashCubit extends Cubit<SplashState> {

  final TokenService _tokenService;

  SplashCubit(this._tokenService)
      : super(SplashInitial());

Future<void> checkLogin() async {
  // Optional: Show splash for 2 seconds
  await Future.delayed(const Duration(seconds: 2));
 
  final token = await _tokenService.getToken();

  if (token != null && token.isNotEmpty) {
    emit(SplashAuthenticated());
  } else {
    emit(SplashUnauthenticated());
  }
}
}