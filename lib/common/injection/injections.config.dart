// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source/user/user_cache_datasource.dart' as _i7;
import '../../data/data_source/user/user_cache_datasource_impl.dart' as _i8;
import '../../data/data_source/user/user_cloud_datasource.dart' as _i9;
import '../../data/data_source/user/user_cloud_datasource_impl.dart' as _i10;
import '../../data/data_source/user/user_datasource_factory.dart' as _i11;
import '../../data/firebase/service/user_service.dart' as _i5;
import '../../data/firebase/service/user_service_impl.dart' as _i6;
import '../../data/repositories/user_repository_impl.dart' as _i13;
import '../../domain/repositories/user_repository.dart' as _i12;
import '../../domain/use%20cases/user_use_cases/get_user_usecase.dart' as _i14;
import '../../domain/use%20cases/user_use_cases/sign_in_usecase.dart' as _i15;
import '../../domain/use%20cases/user_use_cases/sign_out_usecase.dart' as _i16;
import '../../domain/use%20cases/user_use_cases/sign_up_usecase.dart' as _i17;
import '../../domain/use%20cases/user_use_cases/update_user_usecase.dart'
    as _i18;
import '../../presentation/views/home/cubit/home_cubit.dart' as _i20;
import '../../presentation/views/login/cubit/login_cubit.dart' as _i3;
import '../../presentation/views/sign_in/cubit/signin_cubit.dart' as _i19;
import '../../presentation/views/sign_up/cubit/signup_cubit.dart' as _i21;
import '../../presentation/views/splash/cubit/splash_cubit.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LoginCubit>(() => _i3.LoginCubit());
    gh.factory<_i4.SplashCubit>(() => _i4.SplashCubit());
    gh.factory<_i5.UserService>(() => _i6.UserServiceImpl());
    gh.factory<_i7.UserCacheDatasource>(() => _i8.UserCacheDatasourceImpl());
    gh.factory<_i9.UserCloudDatasource>(
        () => _i10.UserCloudDatasourceImpl(gh<_i5.UserService>()));
    gh.factory<_i11.UserDatasourceFactory>(() => _i11.UserDatasourceFactory(
          gh<_i7.UserCacheDatasource>(),
          gh<_i9.UserCloudDatasource>(),
        ));
    gh.factory<_i12.UserRepository>(
        () => _i13.UserRepositoryImpl(gh<_i11.UserDatasourceFactory>()));
    gh.factory<_i14.GetUserUsecase>(
        () => _i14.GetUserUsecase(gh<_i12.UserRepository>()));
    gh.factory<_i15.SignInUsecase>(
        () => _i15.SignInUsecase(gh<_i12.UserRepository>()));
    gh.factory<_i16.SignOutUsecase>(
        () => _i16.SignOutUsecase(gh<_i12.UserRepository>()));
    gh.factory<_i17.SignUpUsecase>(
        () => _i17.SignUpUsecase(gh<_i12.UserRepository>()));
    gh.factory<_i18.UpdateUserUsecase>(
        () => _i18.UpdateUserUsecase(gh<_i12.UserRepository>()));
    gh.factory<_i19.SigninCubit>(
        () => _i19.SigninCubit(gh<_i15.SignInUsecase>()));
    gh.factory<_i20.HomeCubit>(() => _i20.HomeCubit(
          gh<_i16.SignOutUsecase>(),
          gh<_i14.GetUserUsecase>(),
        ));
    gh.factory<_i21.SignupCubit>(() => _i21.SignupCubit(
          gh<_i17.SignUpUsecase>(),
          gh<_i18.UpdateUserUsecase>(),
        ));
    return this;
  }
}
