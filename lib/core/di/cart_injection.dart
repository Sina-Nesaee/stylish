import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/cart/data/datasources/cart_local_data_source.dart';
import 'package:stylish/feathers/cart/data/datasources/cart_local_data_source_impl.dart';
import 'package:stylish/feathers/cart/data/repositories/cart_item_repository_impl.dart';
import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';
import 'package:stylish/feathers/cart/domain/usecases/add_to_cart.usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/Decrease_Quantity_usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/get_cart_item_usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/increase_quantity_usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/calculate_cart_price_total_usecase.dart';
import 'package:stylish/feathers/cart/domain/usecases/calculate_quantity_total_usecase.dart';
import 'package:stylish/feathers/cart/presentation/bloc/cart_item_bloc.dart';

void registerCartDependency() {
  getIt.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<CartRepository>(
    () => CartItemRepositoryImpl(localDataSource: getIt<CartLocalDataSource>()),
  );
  getIt.registerLazySingleton<AddToCart>(
    () => AddToCart(repository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<DecreaseQuantity>(
    () => DecreaseQuantity(repository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<GetCartItem>(
    () => GetCartItem(repository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<IncreaseQuantity>(
    () => IncreaseQuantity(repository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<RemoveFromCart>(
    () => RemoveFromCart(repository: getIt<CartRepository>()),
  );
  getIt.registerLazySingleton<CalculateCartPriceTotal>(
    () => CalculateCartPriceTotal(),
  );
  getIt.registerLazySingleton<CalculateQuantityTotal>(
    () => CalculateQuantityTotal(),
  );

  getIt.registerFactory<CartItemBloc>(
    () => CartItemBloc(
      getCartItems: getIt<GetCartItem>(),
      decreaseQuantity: getIt<DecreaseQuantity>(),
      increaseQuantity: getIt<IncreaseQuantity>(),
      removeFromCart: getIt<RemoveFromCart>(),
      addToCart: getIt<AddToCart>(),
      calculateCartPriceTotal: getIt<CalculateCartPriceTotal>(),
      calculateQuantityTotal: getIt<CalculateQuantityTotal>(),
    ),
  );
}
