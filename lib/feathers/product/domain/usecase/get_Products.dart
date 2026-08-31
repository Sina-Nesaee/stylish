import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/product/domain/repositories/prodct_Repository.dart';

class GetProducts {
  final ProdctRepository repository;

  GetProducts({required this.repository});
  Future<List<Product>> call(){
    return repository.getProducts();

  }
}