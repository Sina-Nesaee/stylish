

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<Product>> searchproducts(String query);
}