import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/datasources/logout/logout_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/datasources/logout/logout_remote_data_source_impl.dart';
import 'package:stylish/feathers/auth/domain/repositories/logout_repository.dart';


import 'package:stylish/feathers/auth/domain/usecases/logout_usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/logout/logout_bloc.dart';

import '../../feathers/auth/data/repositories/logout_repository_impl.dart';

void registerLogoutDependency() {
  getIt.registerLazySingleton<LogoutRemoteDataSource>(
    () => LogoutRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<LogoutRepository>(
    () =>
        LogoutRepositoryImpl(remoteDataSource: getIt<LogoutRemoteDataSource>()),
  );
  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(repository: getIt<LogoutRepository>()),
  );
  getIt.registerFactory<LogoutBloc>(
    () => LogoutBloc(logoutUsecase: getIt<LogoutUsecase>()),
  );
}
