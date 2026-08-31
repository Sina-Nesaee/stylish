part of 'cart_item_bloc.dart';

@immutable
sealed class CartItemState {}

final class CartItemInitial extends CartItemState {}

final class CartItemLoading extends CartItemState {}

final class CartItemSuccess extends CartItemState {
  final List<CartItem> items;
  final double totalprice;
  final int totalQuantity;

  CartItemSuccess({
    required this.items,
    required this.totalprice,
    required this.totalQuantity,
  });
}

final class CartItemError extends CartItemState {
  final String message;

  CartItemError({required this.message});
}
