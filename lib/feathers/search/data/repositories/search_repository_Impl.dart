import 'package:stylish/feathers/product/domain/entities/product_entity.dart';
import 'package:stylish/feathers/search/data/datasources/search_remote_data_source.dart';
import 'package:stylish/feathers/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> searchProducts(String query) {
    return remoteDataSource.searchproducts(query);
  }
}