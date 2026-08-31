import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/category/domain/usecase/getCategories.dart';
import 'package:stylish/feathers/home/presentaition/home_bloc/home_bloc.dart';
import 'package:stylish/feathers/product/domain/usecase/get_Product_Discount%20.dart';
import 'package:stylish/feathers/product/domain/usecase/get_new_arrivals.dart';
import 'package:stylish/feathers/product/domain/usecase/get_recommand_products.dart';
import 'package:stylish/feathers/product/domain/usecase/get_trending_product.dart';

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
