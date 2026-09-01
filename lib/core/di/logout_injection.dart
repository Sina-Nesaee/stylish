import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/dataSource/Logout/Logout_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/dataSource/Logout/Logout_remote_data_source_Impl.dart';
import 'package:stylish/feathers/auth/domain/repository/Logout_repository.dart';
import 'package:stylish/feathers/auth/data/repository/Logout_repository_impl.dart';
import 'package:stylish/feathers/auth/domain/usecase/Logout_Usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/logout/logout_bloc.dart';

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
