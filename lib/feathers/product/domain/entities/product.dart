class Product {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final double price;
  final double rate;
  final int views;
  final List<String> size;
  final double? discount;
  final String brand;
  final String category;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.rate,
    required this.views,
    required this.size,
    required this.discount,
    required this.brand,
    required this.category, required this.createdAt,
  });
}
