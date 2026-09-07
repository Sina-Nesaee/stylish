
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';

abstract class CartLocalDataSource {
   List<CartItem> getCartItem();
  void addToCart(CartItem item);
  void removeFromCart(int productId);
  void increaseQuantity(int productId);
  void decreaseQuantity(int productId);
}