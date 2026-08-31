

import 'package:dio/dio.dart';

import 'package:stylish/feathers/product/data/Model/product_Model.dart';
import 'package:stylish/feathers/product/data/dataSource/product_remote_data_source.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;

  ProductRemoteDatasourceImpl({required this.dio});

  @override
  Future<ProductModel> getProductById(int id) async {
    final response = await dio.get('/products/$id');
    return ProductModel.fromJson(response.data);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('/products');
    final List<dynamic> data = response.data;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }



}
