import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/dataSource/Register/Register_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/dataSource/Register/Register_remote_data_source_Impl.dart';
import 'package:stylish/feathers/auth/data/repository/register_repository_Impl.dart';
import 'package:stylish/feathers/auth/domain/repository/Register_repository.dart';
import 'package:stylish/feathers/auth/domain/usecase/Register_Usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/register/register_bloc.dart';

void registerRegisterDependency() {
  getIt.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      remoteDataSource: getIt<RegisterRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(repository: getIt<RegisterRepository>()),
  );
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerUsecase: getIt<RegisterUsecase>()),
  );
}
