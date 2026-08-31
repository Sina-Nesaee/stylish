
import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/product/domain/repositories/prodct_Repository.dart';

class GetProductDiscount  {
  final ProdctRepository repository;

  GetProductDiscount({required this.repository});
  Future<List<Product>> call()async{
    final product = List<Product> .from(await repository.getProducts());
    product.where((product) => product.discount! > 50,).toList();
    return product;
  }
}