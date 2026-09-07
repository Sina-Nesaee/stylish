import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class DecreaseQuantity {
  final CartRepository repository;

  DecreaseQuantity({required this.repository});
void call(int productId){
  repository.decreaseQuantity(productId);
}
}