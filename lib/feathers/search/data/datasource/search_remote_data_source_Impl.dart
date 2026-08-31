import 'package:dio/dio.dart';
import 'package:stylish/feathers/product/data/Model/product_Model.dart';
import 'package:stylish/feathers/search/data/datasource/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
 
  final Dio dio;

  SearchRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final response = await dio.get(
      '/products/search',
      queryParameters: {'q': query},
    );
    final List<dynamic> Product = response.data;
    return Product.map((json) => ProductModel.fromJson(json)).toList();
  }
}
