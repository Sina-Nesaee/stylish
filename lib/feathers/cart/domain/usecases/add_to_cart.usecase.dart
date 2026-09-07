
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';
import 'package:stylish/feathers/cart/domain/repositories/cart_item_repository.dart';

class AddToCart {
  final CartRepository repository;

  AddToCart({required this.repository});
   void call(CartItem item){
    repository.addToCart(item);
  }
}