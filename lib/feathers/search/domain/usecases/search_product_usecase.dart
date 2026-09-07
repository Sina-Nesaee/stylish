import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/search/domain/repositories/search_repository.dart';

class SearchProduct {
  final SearchRepository repository;

  SearchProduct({required this.repository});
  Future<List<Product>> call(String query){
    return repository.searchProducts(query);
  }

}