import 'package:stylish/feathers/category/domain/entities/categories.dart';
import 'package:stylish/feathers/category/domain/repositories/category_Repository.dart';

class Getcategories {
  final CategoryRepository repository;

  Getcategories({required this.repository});
  Future<List<Category>> call() {
    return repository.getCategories();
  }
}
