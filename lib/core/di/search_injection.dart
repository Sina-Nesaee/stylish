import 'package:dio/dio.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/search/data/datasources/search_remote_data_source.dart';
import 'package:stylish/feathers/search/data/datasources/search_remote_data_source_impl.dart';
import 'package:stylish/feathers/search/data/repositories/search_repository_impl.dart';
import 'package:stylish/feathers/search/domain/repositories/search_repository.dart';
import 'package:stylish/feathers/search/domain/usecases/search_product_usecase.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';

void registerSearchDependency() {
  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<SearchRepository>(
    () =>
        SearchRepositoryImpl(remoteDataSource: getIt<SearchRemoteDataSource>()),
  );
  getIt.registerLazySingleton<SearchProduct>(
    () => SearchProduct(repository: getIt<SearchRepository>()),
  );
  getIt.registerFactory<SearchBloc>(() => SearchBloc(getIt<SearchProduct>()));
}
