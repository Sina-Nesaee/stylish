import 'package:stylish/feathers/cart/data/datasource/cart_local_data_source.dart';
import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final List<CartItem> _items = [];
  @override
  void addToCart(CartItem item) {
    final index = _items.indexWhere(
      (CartItem cartItem) => cartItem.product.id == item.product.id,
    );
    if (index != -1) {
      final oldItem = _items[index];
      _items[index] = CartItem(
        product: oldItem.product,
        quantity: oldItem.quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }
  }

  @override
  void decreaseQuantity(int productId) {
    final index = _items.indexWhere(
      (CartItem cartItem) => cartItem.product.id == productId,
    );
    if (index != -1) {
      final item = _items[index];
      if (item.quantity > 1) {
        _items[index] = CartItem(
          product: item.product,
          quantity: item.quantity - 1,
        );
      }
    }
  }

  @override
  List<CartItem> getCartItem() {
 return List.unmodifiable(_items);
  }

  @override
  void increaseQuantity(int productId) {
    final index = _items.indexWhere(
      (CartItem cartItem) => cartItem.product.id == productId,
    );
    if (index != -1) {
      final item = _items[index];
      _items[index] = CartItem(
        product: item.product,
        quantity: item.quantity + 1,
      );
    }
  }

  @override
  void removeFromCart(int productId) {
    _items.removeWhere((CartItem cartItem) => cartItem.product.id == productId);
  }
}
