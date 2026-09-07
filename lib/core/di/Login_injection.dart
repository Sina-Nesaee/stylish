

import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/datasources/login/login_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/datasources/login/login_remote_data_source_impl.dart';
import 'package:stylish/feathers/auth/data/repositories/login_repository_impl.dart';
import 'package:stylish/feathers/auth/domain/repositories/login_repository.dart';
import 'package:stylish/feathers/auth/domain/usecases/login_apple_usecase.dart';
import 'package:stylish/feathers/auth/domain/usecases/login_facebook_usecase.dart';
import 'package:stylish/feathers/auth/domain/usecases/login_google_usecase.dart';
import 'package:stylish/feathers/auth/domain/usecases/login_usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/login/login_bloc.dart';

void registerLoginDependency() {
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: getIt<LoginRemoteDataSource>()),
  );
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(repository: getIt<LoginRepository>()),
  );
  getIt.registerLazySingleton<LoginAppleUsecase>(
    () => LoginAppleUsecase(repository: getIt<LoginRepository>()),
  );
  getIt.registerLazySingleton<LoginFacebookUsecase>(
    () => LoginFacebookUsecase(repository: getIt<LoginRepository>()),
  );
  getIt.registerLazySingleton<LoginGoogleUsecase>(
    () => LoginGoogleUsecase(repository: getIt<LoginRepository>()),
  );
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginUsecase: getIt<LoginUsecase>(),
      loginAppleUsecase: getIt<LoginAppleUsecase>(),
      loginGoogleUsecase: getIt<LoginGoogleUsecase>(),
      loginFacebookUsecase: getIt<LoginFacebookUsecase>(),
    ),
  );
}
