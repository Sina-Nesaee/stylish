
import 'package:stylish/feathers/cart/data/datasource/cart_local_data_source.dart';
import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

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
