import 'package:bloc/bloc.dart';
import 'package:stylish/feathers/product/domain/usecase/get_Product_Discount%20.dart';
import 'package:stylish/feathers/product/domain/usecase/get_new_arrivals.dart';
import 'package:stylish/feathers/product/domain/usecase/get_recommand_products.dart';
import 'package:stylish/feathers/product/domain/usecase/get_trending_product.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_event.dart';
import 'package:stylish/feathers/product/presentation/bloc/product_discovery/product_discovery_state.dart';



class ProductDiscoveryBloc extends Bloc<ProductDiscoveryEvent, ProductDiscoveryState> {
  final GetNewArrivals getNewArrivals;
  final GetTrendingProducts getTrendingProducts;
  final GetProductDiscount getProductDiscount;
  final GetRecommandProducts getRecommandProducts;
  ProductDiscoveryBloc({
    required this.getNewArrivals,
    required this.getTrendingProducts,
    required this.getProductDiscount,
    required this.getRecommandProducts,
  }) : super(ProductInitial()) {

    on<GetNewArrivalsEvent>(_onGetNewArrivals);
    on<GetTrendingProductsEvent>(_onGetTrendingProduct);
    on<GetRecommandProductsEvent>(_onGetRecommandProducts);
    on<GetProductDiscountEvent>(_onGetProductDiscount);
  }
  Future<void> _onGetRecommandProducts(
    GetRecommandProductsEvent event,
    Emitter<ProductDiscoveryState> emit,
  ) async {
    emit(RecommandProductsLoading());
    try {
      final  products = await getRecommandProducts();
      emit(RecommandProductsLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> _onGetProductDiscount(  GetProductDiscountEvent event,
    Emitter<ProductDiscoveryState> emit,) async {
      emit(ProductDiscountLoading());
      try{
        final products = await getProductDiscount();
        emit(ProductDiscountLoaded(products: products));
      }
      catch(e){
        emit(ProductError(message: e.toString()));
      }
    }

  Future<void> _onGetNewArrivals(
    GetNewArrivalsEvent event,
    Emitter<ProductDiscoveryState> emit,
  ) async {
    emit(NewArrivalsLoading());
    try {
      final product = await getNewArrivals();
      emit(NewArrivalsSuccess(products: product));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  Future<void> _onGetTrendingProduct(
    GetTrendingProductsEvent event,
    Emitter<ProductDiscoveryState> emit,
  ) async {
    emit(NewArrivalsLoading());
    try {
      final product = await getTrendingProducts();
      emit(TrendingProductSuccess(products: product));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
