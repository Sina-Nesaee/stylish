import 'package:stylish/feathers/category/data/datasource/category_remote_data_source.dart';
import 'package:stylish/feathers/category/domain/entities/categories.dart';
import 'package:stylish/feathers/category/domain/repositories/category_Repository.dart';

class CategoryRepositroyImpl implements CategoryRepository{
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositroyImpl({required this.remoteDataSource});
  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategory();
  }

}