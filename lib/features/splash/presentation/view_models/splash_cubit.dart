import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testly/features/auth/domain/use_cases/token_usecases/token_usecases.dart';
import 'package:testly/features/splash/presentation/view_models/splash_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class SplashCubit extends Cubit<SplashState> {

  final GetTokenUseCase _getTokenUseCase;

  SplashCubit(this._getTokenUseCase)
      : super(SplashInitial());

Future<void> checkLogin() async {
  // Optional: Show splash for 2 seconds
  await Future.delayed(const Duration(seconds: 2));

  final token = await _getTokenUseCase();

  if (token != null && token.isNotEmpty) {
    emit(SplashAuthenticated());
  } else {
    emit(SplashUnauthenticated());
  }
}
}