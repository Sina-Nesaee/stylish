import 'package:stylish/feathers/category/domain/entities/categories.dart';

class CategoryModel extends Category {
  CategoryModel({required super.id, required super.name, required super.image});
  factory CategoryModel.fromjson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
