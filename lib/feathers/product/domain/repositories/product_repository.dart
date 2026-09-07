

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

abstract class ProdctRepository {
  Future<List<Product>> getProducts();

  Future<Product> getProductById(int id);

}
