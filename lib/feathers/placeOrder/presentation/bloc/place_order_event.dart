part of 'place_order_bloc.dart';

@immutable
sealed class PlaceOrderEvent {}
class PlaceOrderButtonPressed extends PlaceOrderEvent{
  final Order order;

  PlaceOrderButtonPressed({required this.order});
}
