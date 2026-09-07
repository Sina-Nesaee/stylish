

import 'package:dio/dio.dart';
import 'package:stylish/feathers/product/data/models/product_model.dart';
import 'package:stylish/feathers/search/data/datasources/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
 
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<ProductModel>> searchproducts(String query) async {
    final response = await dio.get(
      '/products/search',
      queryParameters: {'q': query},
    );
    final List<dynamic> product = response.data;
    return product.map((json) => ProductModel.fromJson(json)).toList();
  }
}
