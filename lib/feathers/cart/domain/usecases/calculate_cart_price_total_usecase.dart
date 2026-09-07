
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';

class CalculateCartPriceTotal {
  double call(List<CartItem> items) {
    return items.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }
}


