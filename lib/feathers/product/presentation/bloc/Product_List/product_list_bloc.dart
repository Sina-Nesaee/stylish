

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/product/domain/usecase/get_Products.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {

  final GetProducts getProducts;

  ProductListBloc({
    required this.getProducts,

  }) : super(ProductInitial()) {
    on<GetProductsEvent>(_onGetProducts);

  }
  
    
  Future<void> _onGetProducts(
    GetProductsEvent event,
    Emitter<ProductListState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await getProducts();

      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
 }
  

