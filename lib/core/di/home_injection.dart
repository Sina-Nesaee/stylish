import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/category/domain/usecases/get_categories_usecase.dart';
import 'package:stylish/feathers/home/presentaition/home_bloc/home_bloc.dart';
import 'package:stylish/feathers/product/domain/useCases/get_product_discount_usecase%20.dart';
import 'package:stylish/feathers/product/domain/useCases/get_new_arrivals_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_recommand_products_usecase.dart';
import 'package:stylish/feathers/product/domain/useCases/get_trending_product_usecase.dart';

void registerHomeDependency() {
  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      getNewArrivals: getIt<GetNewArrivals>(),
      getTrendingProducts: getIt<GetTrendingProducts>(),
      getProductDiscount: getIt<GetProductDiscount>(),
      getRecommandProducts: getIt<GetRecommandProducts>(),
      getcategories: getIt<Getcategories>(),
    ),
  );
}
