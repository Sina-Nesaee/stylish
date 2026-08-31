import 'package:stylish/feathers/category/domain/entities/categories.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();


}