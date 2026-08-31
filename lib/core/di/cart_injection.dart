import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/cart/data/datasource/cart_local_data_source.dart';
import 'package:stylish/feathers/cart/data/datasource/cart_local_data_source_Impl.dart';
import 'package:stylish/feathers/cart/data/repositories/cart_Item_repository_Impl.dart';
import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';
import 'package:stylish/feathers/cart/domain/usecase/Add_To_cart.dart';
import 'package:stylish/feathers/cart/domain/usecase/Decrease_Quantity.dart';
import 'package:stylish/feathers/cart/domain/usecase/Get_Cart_Item.dart';
import 'package:stylish/feathers/cart/domain/usecase/Increase_Quantity.dart';
import 'package:stylish/feathers/cart/domain/usecase/Remove_From_Cart.dart';
import 'package:stylish/feathers/cart/domain/usecase/calculate_cart_price_total.dart';
import 'package:stylish/feathers/cart/domain/usecase/calculate_quantity_total.dart';
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
