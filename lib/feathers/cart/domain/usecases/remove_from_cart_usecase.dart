import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class RemoveFromCart {
  final CartRepository repository;

  RemoveFromCart({required this.repository});
  void call(int productId){
    repository.removeFromCart(productId);
  }
}