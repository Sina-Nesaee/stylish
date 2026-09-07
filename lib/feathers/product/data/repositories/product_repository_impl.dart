

import 'package:stylish/feathers/product/data/datasources/product_remote_data_source.dart';
import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/product/domain/repositories/product_Repository.dart';

class ProductRepositoryImpl implements ProdctRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Product> getProductById(int id) async {
    return await remoteDatasource.getProductById(id);
  }

  @override
  Future<List<Product>> getProducts() async {
    return await remoteDatasource.getProducts();
  }
}
