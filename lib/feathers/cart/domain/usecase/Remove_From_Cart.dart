import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

class RemoveFromCart {
  final CartRepository repository;

  RemoveFromCart({required this.repository});
  void call(int productId){
    repository.removeFromCart(productId);
  }
}