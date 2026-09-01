import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/auth/data/dataSource/ResetPassword/resetPassword_remote_data_source.dart';
import 'package:stylish/feathers/auth/data/dataSource/resetPassword/resetPassword_remote_data_source_Impl.dart';
import 'package:stylish/feathers/auth/data/repository/ResetPassword_repository_Impl.dart';
import 'package:stylish/feathers/auth/domain/repository/ResetPassword_repository.dart';
import 'package:stylish/feathers/auth/domain/usecase/resetPassword_Usecase.dart';
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
