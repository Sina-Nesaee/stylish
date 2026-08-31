part of 'product_bloc.dart';

@immutable
sealed class ProductDetailEvent {}



class GetProductByIdEvent extends ProductDetailEvent {
  final int id;

  GetProductByIdEvent({required this.id});
}


