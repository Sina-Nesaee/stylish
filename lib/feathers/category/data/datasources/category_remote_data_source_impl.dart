import 'package:dio/dio.dart';
import 'package:stylish/feathers/category/data/datasources/category_remote_data_source.dart';
import 'package:stylish/feathers/category/data/models/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategory() async {
    final response = await dio.get('/category');
    final category = response.data
        .map((json) => CategoryModel.fromjson(json))
        .tolist();

    return category;
  }
}
