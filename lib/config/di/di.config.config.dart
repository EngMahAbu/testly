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
import '../../features/auth/domain/use_cases/signup_use_case.dart' as _i571;
import '../../features/auth/presentation/login/view_model/cubit/login_view_model.dart'
    as _i397;
import '../../features/auth/presentation/signup/view_model/cubit/signup_view_model.dart'
    as _i1073;
import '../../features/splash/presentation/view_models/splash_cubit.dart'
    as _i670;
import '../dio/dio_module.dart' as _i977;
import '../dio/token_service.dart' as _i947;
import '../storage_module/token_storage.dart' as _i741;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i741.SecureStorageService>(
      () => dioModule.secureStorageService,
    );
    gh.factory<_i485.AuthLocalDataSource>(
      () => _i277.AuthLocalDataSourceImpl(gh<_i741.SecureStorageService>()),
    );
    gh.singleton<_i947.TokenService>(
      () => dioModule.tokenService(gh<_i741.SecureStorageService>()),
    );
    gh.factory<_i670.SplashCubit>(
      () => _i670.SplashCubit(gh<_i947.TokenService>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i741.SecureStorageService>(),
        gh<_i947.TokenService>(),
      ),
    );
    gh.singleton<_i213.AuthApiClient>(
      () => _i213.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.singleton<_i432.AuthRemoteDataSource>(
      () => _i411.AuthRemoteDataSourceImpl(gh<_i213.AuthApiClient>()),
    );
    gh.factory<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i432.AuthRemoteDataSource>(),
        gh<_i485.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.singleton<_i571.SignupUseCase>(
      () => _i571.SignupUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i397.LoginViewModel>(
      () => _i397.LoginViewModel(
        gh<_i1012.LoginUseCase>(),
        gh<_i947.TokenService>(),
      ),
    );
    gh.factory<_i1073.SignupViewModel>(
      () => _i1073.SignupViewModel(gh<_i571.SignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
