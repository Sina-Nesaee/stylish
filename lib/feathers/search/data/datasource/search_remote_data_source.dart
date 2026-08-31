import 'package:stylish/feathers/product/domain/entities/product.dart';

abstract class SearchRemoteDataSource {
  Future<List<Product>> searchProducts(String query);
}