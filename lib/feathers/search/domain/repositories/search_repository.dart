
import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

abstract class SearchRepository {
  Future<List<Product>> searchProducts(String query);


}