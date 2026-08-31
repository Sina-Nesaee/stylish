part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductInitial extends ProductListState {}
final class ProductLoading extends ProductListState {}
final class ProductSuccess extends ProductListState {
  final List<Product> products;

  ProductSuccess({required this.products});

}

final class ProductError extends ProductListState {
  final String message;

  ProductError({required this.message});

}
