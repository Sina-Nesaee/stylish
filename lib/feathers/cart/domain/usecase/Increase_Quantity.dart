import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

class IncreaseQuantity {
  final CartRepository repository;

  IncreaseQuantity({required this.repository});
  void call(int productId){
    repository.increaseQuantity(productId);
  }
}