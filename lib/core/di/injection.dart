import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylish/core/di/cart_injection.dart';
import 'package:stylish/core/di/categories_injection.dart';
import 'package:stylish/core/di/checkout_injection.dart';
import 'package:stylish/core/di/home_injection.dart';
import 'package:stylish/core/di/order_injection.dart';
import 'package:stylish/core/di/product_injection.dart';
import 'package:stylish/core/di/search_injection.dart';

final getIt = GetIt.instance;
void setupDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  registerProductDependency();
  registerCategoriesDependency();
  registerHomeDependency();
 registerSearchDependency();
 registerCartDependency();
 registerCheckoutDependency();
 registerOrderDependency();
}
