import 'package:flutter/cupertino.dart';
import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

@immutable
sealed class ProductDiscoveryState {
}

final class ProductInitial extends ProductDiscoveryState {


  
}

final class TrendingProductLoading extends ProductDiscoveryState {}

final class TrendingProductSuccess extends ProductDiscoveryState {
  final List<Product> products;

  TrendingProductSuccess({required this.products});
}

final class NewArrivalsLoading extends ProductDiscoveryState {}

final class NewArrivalsSuccess extends ProductDiscoveryState {
  final List<Product> products;

  NewArrivalsSuccess({required this.products});
}

final class ProductDiscountLoading extends ProductDiscoveryState {}

final class ProductDiscountLoaded extends ProductDiscoveryState {
  final List<Product> products;
  ProductDiscountLoaded({required this.products});
}

final class RecommandProductsLoading extends ProductDiscoveryState {}

final class RecommandProductsLoaded extends ProductDiscoveryState {
  final List<Product> products;
  RecommandProductsLoaded({required this.products});
}

final class ProductError extends ProductDiscoveryState {
  final String message;

  ProductError({required this.message});
}
