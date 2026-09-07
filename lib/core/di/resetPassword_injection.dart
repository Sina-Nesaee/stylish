import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/datasources/resetpassword/resetPassword_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/datasources/resetpassword/resetpassword_remote_data_source_impl.dart';
import 'package:stylish/feathers/auth/data/repositories/resetpassword_repository_impl.dart';
import 'package:stylish/feathers/auth/domain/repositories/resetpassword_repository.dart';
import 'package:stylish/feathers/auth/domain/usecases/resetPassword_usecase.dart';
import 'package:stylish/feathers/auth/presentation/bloc/resetPassword/reset_password_bloc.dart';

void registerResetPasswordDependency() {
  getIt.registerLazySingleton<ResetpasswordRemoteDataSource>(
    () => ResetpasswordRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ResetpasswordRepository>(
    () => ResetpasswordRepositoryImpl(
      remoteDataSource: getIt<ResetpasswordRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<ResetpasswordUsecase>(
    () => ResetpasswordUsecase(repository: getIt<ResetpasswordRepository>()),
  );
  getIt.registerFactory<ResetPasswordBloc>(
    () =>
        ResetPasswordBloc(resetpasswordUsecase: getIt<ResetpasswordUsecase>()),
  );
}
