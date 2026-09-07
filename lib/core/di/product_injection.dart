
import 'package:dio/dio.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/product/data/datasources/product_remote_data_source.dart';
import 'package:stylish/feathers/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:stylish/feathers/product/data/repositories/product_repository_impl.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';
import 'package:stylish/feathers/product/domain/useCases/get_product_by_id_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_product_discount_usecase%20.dart';
import 'package:stylish/feathers/product/domain/useCases/get_products_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_new_arrivals_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_recommand_products_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_trending_product_usecase.dart';
import 'package:stylish/feathers/product/presentation/bloc/Product_List/product_list_bloc.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_detail/product_bloc.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_bloc.dart';

void registerProductDependency(){
   getIt.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(dio: getIt<Dio>()))
  ;
  getIt.registerLazySingleton<ProdctRepository>(
    () => ProductRepositoryImpl(
      remoteDatasource: getIt<ProductRemoteDatasource>(),
    ),
  );
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(repository: getIt<ProdctRepository>()),
  );
  getIt.registerLazySingleton<GetproductById>(
    () => GetproductById(repsitory: getIt<ProdctRepository>()),
  );
  getIt.registerLazySingleton<GetNewArrivals>(
    () => GetNewArrivals(repository: getIt<ProdctRepository>()),
  );

  getIt.registerLazySingleton<GetTrendingProducts>(
    () => GetTrendingProducts(repository: getIt<ProdctRepository>()),
  );
  getIt.registerLazySingleton<GetProductDiscount>(
    () => GetProductDiscount(repository: getIt<ProdctRepository>()),
  );
  getIt.registerLazySingleton<GetRecommandProducts>(
    () => GetRecommandProducts(repository: getIt<ProdctRepository>()),
  );

  getIt.registerFactory<ProductListBloc>(
    () => ProductListBloc(getProducts: getIt<GetProducts>()),
  );
 
  getIt.registerFactory<ProductDiscoveryBloc>(
    () => ProductDiscoveryBloc(
      getNewArrivals: getIt<GetNewArrivals>(),
      getTrendingProducts: getIt<GetTrendingProducts>(),
      getProductDiscount: getIt<GetProductDiscount>(),
      getRecommandProducts: getIt<GetRecommandProducts>(),
    ),
  );
  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(getproductbyid: getIt<GetproductById>()),
  );
}