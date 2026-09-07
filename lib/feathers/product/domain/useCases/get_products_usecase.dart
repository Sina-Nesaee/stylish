

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';

class GetProducts {
  final ProdctRepository repository;

  GetProducts({required this.repository});
  Future<List<Product>> call(){
    return repository.getProducts();

  }
}