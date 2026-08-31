import 'package:dio/dio.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/placeOrder/data/dataSource/remot_data_source.dart';
import 'package:stylish/feathers/placeOrder/data/dataSource/remote_data_source_Impl.dart';
import 'package:stylish/feathers/placeOrder/data/repository/order_repository_Impl.dart';
import 'package:stylish/feathers/placeOrder/domain/repository/order_repository.dart';
import 'package:stylish/feathers/placeOrder/domain/usecase/creat_order_usecase.dart';
import 'package:stylish/feathers/placeOrder/domain/usecase/place_order_usecase.dart';
import 'package:stylish/feathers/placeOrder/presentation/bloc/place_order_bloc.dart';

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
