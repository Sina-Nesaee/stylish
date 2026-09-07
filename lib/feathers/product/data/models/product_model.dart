
import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.images,
    required super.title,
    required super.description,
    required super.price,
    required super.rate,
    required super.views,
    required super.size,
    required super.discount,
    required super.brand,
    required super.category, required super.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      images: List<String>.from(json['images']),
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num ).toDouble(),
      rate: (json['rating'] as num ).toDouble(),
      views: json['views'] ?? null,
      size: List<String>.from(json['size']) ?? [],
      discount: (json['discountPercentage'] as num ).toDouble(),
      brand: json['brand'] ?? '',
      category: json['category'] ?? '', createdAt: json['createdAt'],
    );
  }
}
