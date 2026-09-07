
import 'package:stylish/feathers/cart/data/datasources/cart_local_data_source.dart';
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';
import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class CartItemRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartItemRepositoryImpl({required this.localDataSource});
  @override
  void addToCart(CartItem item) {
    localDataSource.addToCart(item);
  }

  @override
  void decreaseQuantity(int productId) {
    localDataSource.decreaseQuantity(productId);
  }

  @override
  List<CartItem> getCartItem() {
    return localDataSource.getCartItem();
  }

  @override
  void increaseQuantity(int productId) {
    localDataSource.increaseQuantity(productId);
  }

  @override
  void removeFromCart(int productId) {
    localDataSource.removeFromCart(productId);
  }
}
