// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/data_sources/local/auth_local_data_source_impl.dart'
    as _i277;
import '../../features/auth/api/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i411;
import '../../features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i485;
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i432;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/send_password_reset_email_use_case.dart'
    as _i954;
import '../../features/auth/domain/use_cases/signup_use_case.dart' as _i571;
import '../../features/auth/presentation/forget_password/view_model/cubit/forget_password_view_model.dart'
    as _i363;
import '../../features/auth/presentation/login/view_model/cubit/login_view_model.dart'
    as _i359;
import '../../features/auth/presentation/signup/view_model/cubit/signup_view_model.dart'
    as _i1073;
import '../../features/exam/api/client/exam_api_client.dart' as _i666;
import '../../features/exam/api/data_sources/remote/exam_remote_data_source_impl.dart'
    as _i157;
import '../../features/exam/data/data_sources/remote/exam_remote_data_source.dart'
    as _i4;
import '../../features/exam/data/repositories/exam_repository_impl.dart'
    as _i362;
import '../../features/exam/domain/repositories/exam_repository.dart' as _i413;
import '../../features/exam/domain/usecases/get_exams_use_case.dart' as _i347;
import '../../features/exam/domain/usecases/get_question_use_case.dart'
    as _i857;
import '../../features/exam/domain/usecases/get_subjects_use_case.dart'
    as _i816;
import '../../features/exam/presentation/view_model/exam_feat_cubit/exam_cubit.dart'
    as _i274;
import '../../features/splash/presentation/view_models/splash_cubit.dart'
    as _i670;
import '../dio/dio_module.dart' as _i977;
import '../dio/token_service.dart' as _i947;
import '../storage_module/token_storage.dart' as _i559;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i559.SecureStorageService>(
      () => dioModule.secureStorageService,
    );
    gh.factory<_i485.AuthLocalDataSource>(
      () => _i277.AuthLocalDataSourceImpl(gh<_i559.SecureStorageService>()),
    );
    gh.singleton<_i947.TokenService>(
      () => dioModule.tokenService(gh<_i559.SecureStorageService>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i559.SecureStorageService>(),
        gh<_i947.TokenService>(),
      ),
    );
    gh.factory<_i670.SplashCubit>(
      () => _i670.SplashCubit(gh<_i947.TokenService>()),
    );
    gh.singleton<_i213.AuthApiClient>(
      () => _i213.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.singleton<_i666.ExamApiClient>(
      () => _i666.ExamApiClient(gh<_i361.Dio>()),
    );
    gh.singleton<_i432.AuthRemoteDataSource>(
      () => _i411.AuthRemoteDataSourceImpl(gh<_i213.AuthApiClient>()),
    );
    gh.singleton<_i4.ExamRemoteDataSource>(
      () => _i157.ExamRemoteDataSourceImpl(gh<_i666.ExamApiClient>()),
    );
    gh.singleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i432.AuthRemoteDataSource>(),
        gh<_i485.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i413.ExamRepository>(
      () => _i362.ExamRepositoryImpl(gh<_i4.ExamRemoteDataSource>()),
    );
    gh.singleton<_i347.GetExamsUseCase>(
      () => _i347.GetExamsUseCase(gh<_i413.ExamRepository>()),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i954.SendPasswordResetEmailUseCase>(
      () => _i954.SendPasswordResetEmailUseCase(gh<_i787.AuthRepository>()),
    );
    gh.singleton<_i571.SignupUseCase>(
      () => _i571.SignupUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i359.LoginViewModel>(
      () => _i359.LoginViewModel(
        gh<_i1012.LoginUseCase>(),
        gh<_i947.TokenService>(),
      ),
    );
    gh.singleton<_i857.GetQuestionUseCase>(
      () => _i857.GetQuestionUseCase(gh<_i413.ExamRepository>()),
    );
    gh.singleton<_i816.GetSubjectsUseCase>(
      () => _i816.GetSubjectsUseCase(gh<_i413.ExamRepository>()),
    );
    gh.factory<_i363.ForgetPasswordViewModel>(
      () => _i363.ForgetPasswordViewModel(
        gh<_i954.SendPasswordResetEmailUseCase>(),
      ),
    );
    gh.factory<_i1073.SignupViewModel>(
      () => _i1073.SignupViewModel(gh<_i571.SignupUseCase>()),
    );
    gh.factory<_i274.ExamCubit>(
      () => _i274.ExamCubit(
        gh<_i816.GetSubjectsUseCase>(),
        gh<_i347.GetExamsUseCase>(),
        gh<_i857.GetQuestionUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
