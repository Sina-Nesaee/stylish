import 'package:stylish/feathers/category/domain/entities/categories_entity.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();


}