
import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';

abstract class CartLocalDataSource {
   List<CartItem> getCartItem();
  void addToCart(CartItem item);
  void removeFromCart(int productId);
  void increaseQuantity(int productId);
  void decreaseQuantity(int productId);
}