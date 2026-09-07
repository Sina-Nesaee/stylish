import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/category/domain/entities/categories_entity.dart';
import 'package:stylish/feathers/category/domain/usecases/get_categories_usecase.dart';
import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/useCases/get_product_discount_usecase%20.dart';
import 'package:stylish/feathers/product/domain/useCases/get_new_arrivals_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_recommand_products_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_trending_product_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNewArrivals getNewArrivals;
  final GetTrendingProducts getTrendingProducts;
  final GetProductDiscount getProductDiscount;
  final GetRecommandProducts getRecommandProducts;
  final Getcategories getcategories;
  HomeBloc({
    required this.getNewArrivals,
    required this.getTrendingProducts,
    required this.getProductDiscount,
    required this.getRecommandProducts,
    required this.getcategories,
  }) : super(const HomeState()) {
    on<GetHomeDataEvent>(_onGetHomeDataEvent);
  }
  Future<void> _onGetHomeDataEvent(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    _getNewArrivals(emit);
    _getTrendingProducts(emit);
    _getProductDiscount(emit);
    _getRecommandProducts(emit);
    _getCategories(emit);
  }

  Future<void> _getNewArrivals(emit) async {
    emit(state.copywith(newArrivalStatus: StatuSection.loading));
    try {
      final product = await getNewArrivals();
      emit(
        state.copywith(
          newArrivalStatus: StatuSection.success,
          newArrivals: product,
        ),
      );
    } catch (e) {
      emit(
        state.copywith(
          newArrivalStatus: StatuSection.error,
          newArrivalsErrorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _getTrendingProducts(emit) async {
    emit(state.copywith(trendingdStauts: StatuSection.loading));
    try {
      final product = await getTrendingProducts();
      emit(
        state.copywith(
          trendingdStauts: StatuSection.success,
          getTrendingProducts: product,
        ),
      );
    } catch (e) {
      emit(
        state.copywith(
          trendingdStauts: StatuSection.error,
          trendingErrorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _getProductDiscount(emit) async {
    emit(state.copywith(discountStauts: StatuSection.loading));
    try {
      final product = await getProductDiscount();
      emit(
        state.copywith(
          discountStauts: StatuSection.success,
          discountProduct: product,
        ),
      );
    } catch (e) {
      emit(
        state.copywith(
          discountStauts: StatuSection.error,
          discountErrorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _getRecommandProducts(emit) async {
    emit(state.copywith(recomandStatus: StatuSection.loading));
    try {
      final product = await getRecommandProducts();
      emit(
        state.copywith(
          recomandStatus: StatuSection.success,
          recommandProduct: product,
        ),
      );
    } catch (e) {
      emit(
        state.copywith(
          recomandStatus: StatuSection.error,
          recommandErrorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _getCategories(emit) async {
    emit(state.copywith(categoriesStatus: StatuSection.loading));
    try {
      final category = await getcategories();
      emit(
        state.copywith(
          categoriesStatus: StatuSection.success,
          categories: category,
        ),
      );
    } catch (e) {
      emit(
        state.copywith(
          categoriesStatus: StatuSection.error,
          categoriesErrorMessage: e.toString(),
        ),
      );
    }
  }
}
