import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';
import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class GetCartItem {
  final CartRepository repository;

  GetCartItem({required this.repository});
List<CartItem> call() {
    return repository.getCartItem();
  }
}
