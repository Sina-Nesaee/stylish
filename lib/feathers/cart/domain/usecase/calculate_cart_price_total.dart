import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';

class CalculateCartPriceTotal {
  double call(List<CartItem> items) {
    return items.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }
}


