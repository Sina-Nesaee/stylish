import 'package:dio/dio.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/category/data/datasources/category_remote_data_source.dart';
import 'package:stylish/feathers/category/data/datasources/category_remote_data_source_impl.dart';
import 'package:stylish/feathers/category/data/repositories/category_repositroy_impl.dart';
import 'package:stylish/feathers/category/domain/repositories/category_repository.dart';
import 'package:stylish/feathers/category/domain/usecases/get_categories_usecase.dart';
import 'package:stylish/feathers/category/presentation/bloc/category_bloc.dart';

void registerCategoriesDependency() {
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositroyImpl(
      remoteDataSource: getIt<CategoryRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<Getcategories>(
    () => Getcategories(repository: getIt<CategoryRepository>()),
  );
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getIt<Getcategories>()),
  );
}
