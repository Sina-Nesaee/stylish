import 'package:stylish/feathers/category/data/datasources/category_remote_data_source.dart';
import 'package:stylish/feathers/category/domain/entities/categories_entity.dart';
import 'package:stylish/feathers/category/domain/repositories/category_repository.dart';

class CategoryRepositroyImpl implements CategoryRepository{
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositroyImpl({required this.remoteDataSource});
  @override
  Future<List<Category>> getCategories() {
    return remoteDataSource.getCategory();
  }

}