
import 'package:meta/meta.dart';
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';

@immutable
sealed class CartItemEvent {}
class GetCartItemEvent extends CartItemEvent{}
class AddToCartItemEvent extends CartItemEvent {
  final CartItem item;

  AddToCartItemEvent({required this.item});
}

class RemoveFromCartItemEvent extends CartItemEvent {
  final int productId;

  RemoveFromCartItemEvent({required this.productId});
  
}

class IncreaseQuantityCartItemEvent extends CartItemEvent {
   final int productId;

  IncreaseQuantityCartItemEvent({required this.productId});
}

class DecreaseQuantityCartItemEvent extends CartItemEvent {
   final int productId;

  DecreaseQuantityCartItemEvent({required this.productId});
}
