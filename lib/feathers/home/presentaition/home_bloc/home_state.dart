part of 'home_bloc.dart';

class HomeState {
  final StatuSection categoriesStatus;
  final StatuSection newArrivalStatus;
  final StatuSection recomandStatus;
  final StatuSection trendingdStauts;
  final StatuSection discountStauts;
  final List<Product> getTrendingProducts;
  final List<Product> newArrivals;
  final List<Product> recommandProduct;
  final List<Product> discountProduct;
  final List<Category> catagories;
  final String? bannerErrorMessage;
  final String? categoriesErrorMessage;
  final String? newArrivalsErrorMessage;
  final String? recommandErrorMessage;
  final String? trendingErrorMessage;
  final String? discountErrorMessage;

  const HomeState({
     this.categoriesStatus= StatuSection.initial,
     this.newArrivalStatus= StatuSection.initial,
     this.recomandStatus= StatuSection.initial,
     this.trendingdStauts= StatuSection.initial,
     this.discountStauts= StatuSection.initial,
     this.getTrendingProducts =const [],
     this.newArrivals = const[],
     this.recommandProduct = const[],
     this.discountProduct = const[],
     this.bannerErrorMessage = '',
     this.categoriesErrorMessage='',
     this.newArrivalsErrorMessage='',
     this.recommandErrorMessage='',
     this.trendingErrorMessage='',
     this.discountErrorMessage='',
     this.catagories=const[],
  });
  HomeState copywith({
    StatuSection? categoriesStatus,
    StatuSection? newArrivalStatus,
    StatuSection? recomandStatus,
    StatuSection? trendingdStauts,
    StatuSection? discountStauts,
    List<Product>? getTrendingProducts,
    List<Product>? newArrivals,
    List<Product>? recommandProduct,
    List<Product>? discountProduct,
    List<Category>? categories,
    String? bannerErrorMessage,
    String? categoriesErrorMessage,
    String? newArrivalsErrorMessage,
    String? recommandErrorMessage,
    String? trendingErrorMessage,
    String? discountErrorMessage,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      newArrivalStatus: newArrivalStatus ?? this.newArrivalStatus,
      recomandStatus: recomandStatus ?? this.recomandStatus,
      trendingdStauts: trendingdStauts ?? this.trendingdStauts,
      discountStauts: discountStauts ?? this.discountStauts,
      getTrendingProducts: getTrendingProducts ?? this.getTrendingProducts,
      newArrivals: newArrivals ?? this.newArrivals,
      recommandProduct: recommandProduct ?? this.recommandProduct,
      discountProduct: discountProduct ?? this.discountProduct,
      bannerErrorMessage: bannerErrorMessage ?? this.bannerErrorMessage,
      categoriesErrorMessage:
          categoriesErrorMessage ?? this.categoriesErrorMessage,
      newArrivalsErrorMessage:
          newArrivalsErrorMessage ?? this.newArrivalsErrorMessage,
      recommandErrorMessage:
          recommandErrorMessage ?? this.recommandErrorMessage,
      trendingErrorMessage: trendingErrorMessage ?? this.trendingErrorMessage,
      discountErrorMessage: discountErrorMessage ?? this.discountErrorMessage,
      catagories: categories ?? this.catagories,
    );
  }
}

enum StatuSection { initial, loading, success, error }
