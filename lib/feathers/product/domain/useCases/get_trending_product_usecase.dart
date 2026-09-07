

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';

class GetTrendingProducts {
  final ProdctRepository repository;

  GetTrendingProducts({required this.repository});
  Future<List<Product>> call() async {
    final products = List<Product>.from(await repository.getProducts());

    products.sort((a, b) {
      final compareviews = b.views.compareTo(a.views);
      final comparerating = b.rate.compareTo(a.rate);
      if (compareviews != 0) {
        return compareviews;
      }

      return comparerating;
    });
    return products;
  }
}
