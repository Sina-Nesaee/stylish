import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/datasources/register/register_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/repositories/register_repository_impl.dart';
import 'package:stylish/feathers/auth/domain/repositories/register_repository.dart';
import 'package:stylish/feathers/auth/domain/usecases/register_usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/register/register_bloc.dart';

import '../../feathers/auth/data/datasources/register/register_remote_data_source_impl.dart';

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
