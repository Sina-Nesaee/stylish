import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

class GetCartItem {
  final CartRepository repository;

  GetCartItem({required this.repository});
List<CartItem> call() {
    return repository.getCartItem();
  }
}
