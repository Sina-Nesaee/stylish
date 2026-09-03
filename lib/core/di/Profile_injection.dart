import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/profile/data/dataSource/Profile_Remote_Data_Source.dart';
import 'package:stylish/feathers/profile/data/dataSource/Profile_Remote_Data_Source_Impl.dart';
import 'package:stylish/feathers/profile/data/repository/profile_Repository_Impl.dart';
import 'package:stylish/feathers/profile/domain/repasitory/Profile_Repository.dart';
import 'package:stylish/feathers/profile/domain/usecase/get_Profile_Usecase.dart';
import 'package:stylish/feathers/profile/domain/usecase/update_Profile_Usecase.dart';
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
