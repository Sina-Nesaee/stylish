part of 'product_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  ProductDetailLoaded({required this.product});
}

final class ProductError extends ProductDetailState {
  final String message;
  ProductError({required this.message});
}
