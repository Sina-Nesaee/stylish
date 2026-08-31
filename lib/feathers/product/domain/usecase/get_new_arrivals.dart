import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/product/domain/repositories/prodct_Repository.dart';

class GetNewArrivals {
  final ProdctRepository repository;

  GetNewArrivals({required this.repository});
  Future<List<Product>> call() async {
    final products = List<Product>.from(await repository.getProducts());
    products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return products;
  }
}
