import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';

class CalculateQuantityTotal {
  int call(List<CartItem> items) {
    return items.fold(0, (total, item) => total + item.quantity);
  }
}
