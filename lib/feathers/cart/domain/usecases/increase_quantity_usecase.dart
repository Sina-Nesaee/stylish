import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class IncreaseQuantity {
  final CartRepository repository;

  IncreaseQuantity({required this.repository});
  void call(int productId){
    repository.increaseQuantity(productId);
  }
}