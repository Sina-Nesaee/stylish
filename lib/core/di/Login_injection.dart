import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/dataSource/Login/Login_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/dataSource/Login/Login_remote_data_source_Impl.dart';
import 'package:stylish/feathers/auth/data/repository/Login_repository_Impl.dart';
import 'package:stylish/feathers/auth/domain/repository/Login_repository.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Apple_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Facebook_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Google_Usecase.dart';
import 'package:stylish/feathers/auth/domain/usecase/Login_Usecase.dart';
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
