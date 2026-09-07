

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';

class GetRecommandProducts {
  final ProdctRepository repository;

  GetRecommandProducts({required this.repository});
  Future<List<Product>> call() async {
    final product = List<Product>.from(await repository.getProducts());
    product.sort((a, b) => b.rate.compareTo(a.rate));
    return product;
  }
}
