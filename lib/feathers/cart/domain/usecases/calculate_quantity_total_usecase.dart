import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';

class CalculateQuantityTotal {
  int call(List<CartItem> items) {
    return items.fold(0, (total, item) => total + item.quantity);
  }
}
