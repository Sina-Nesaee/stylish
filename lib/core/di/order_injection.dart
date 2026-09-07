import 'package:dio/dio.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/placeorder/data/datasources/remot_data_source.dart';
import 'package:stylish/feathers/placeorder/data/datasources/remote_data_source_impl.dart';
import 'package:stylish/feathers/placeorder/data/repositories/order_repository_impl.dart';
import 'package:stylish/feathers/placeorder/domain/repositories/order_repository.dart';
import 'package:stylish/feathers/placeorder/domain/usecases/creat_order_usecase.dart';
import 'package:stylish/feathers/placeorder/domain/usecases/place_order_usecase.dart';
import 'package:stylish/feathers/placeorder/presentation/bloc/place_order_bloc.dart';

void registerOrderDependency() {
  getIt.registerLazySingleton<OrderRemotDataSource>(
    () => OrderRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(remotDataSource: getIt<OrderRemotDataSource>()),
  );
  getIt.registerLazySingleton<PlaceOrderUsecase>(
    () => PlaceOrderUsecase(orderRepository: getIt<OrderRepository>()),
  );
  getIt.registerLazySingleton<CreatOrderUsecase>(() => CreatOrderUsecase());
  getIt.registerFactory<PlaceOrderBloc>(
    () => PlaceOrderBloc(getIt<PlaceOrderUsecase>()),
  );
}
