
import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/cart/domain/repository/cartItem_Repository.dart';

class AddToCart {
  final CartRepository repository;

  AddToCart({required this.repository});
   void call(CartItem item){
    repository.addToCart(item);
  }
}