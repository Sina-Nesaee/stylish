part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class GetProductsEvent extends ProductListEvent {}

