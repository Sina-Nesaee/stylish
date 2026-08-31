import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

class DecreaseQuantity {
  final CartRepository repository;

  DecreaseQuantity({required this.repository});
void call(int productId){
  repository.decreaseQuantity(productId);
}
}