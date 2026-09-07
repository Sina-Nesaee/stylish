import 'package:stylish/feathers/category/domain/entities/categories_entity.dart';
import 'package:stylish/feathers/category/domain/repositories/category_repository.dart';

class Getcategories {
  final CategoryRepository repository;

  Getcategories({required this.repository});
  Future<List<Category>> call() {
    return repository.getCategories();
  }
}
