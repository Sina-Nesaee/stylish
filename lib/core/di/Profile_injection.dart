import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/profile/data/datasources/profile_remote_data_source.dart';
import 'package:stylish/feathers/profile/data/datasources/profile_remote_data_source_impl.dart';
import 'package:stylish/feathers/profile/data/repositories/profile_repository_impl.dart';
import 'package:stylish/feathers/profile/domain/repasitories/profile_repository.dart';
import 'package:stylish/feathers/profile/domain/usecases/get_profile_usecase.dart';
import 'package:stylish/feathers/profile/domain/usecases/update_profile_usecase.dart';
import 'package:stylish/feathers/profile/presentation/bloc/profile_bloc.dart';

void registerProfileDependency() {
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetProfileUsecase>(
    () => GetProfileUsecase(repository: getIt<ProfileRepository>()),
  );
  getIt.registerLazySingleton<UpdateProfileUsecase>(
    () => UpdateProfileUsecase(repository: getIt<ProfileRepository>()),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      getProfileUsecase: getIt<GetProfileUsecase>(),
      updateProfileUsecase: getIt<UpdateProfileUsecase>(),
    ),
  );
}
