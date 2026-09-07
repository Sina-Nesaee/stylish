

import 'package:stylish/feathers/product/domain/entities/product_entity.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
