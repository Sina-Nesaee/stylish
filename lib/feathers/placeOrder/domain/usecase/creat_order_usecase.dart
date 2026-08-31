import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/checkout/domain/Entity/checkout_Entity.dart';
import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';
import 'package:stylish/feathers/placeOrder/domain/Entity/orderItem.dart';

class CreatOrderUsecase {
  Order call({
    required List<CartItem> orderitem,
    required CheckoutEntity checkout,
    required double totalPrice,
    required int totalQuantity,
  }) {
    final orderItems = orderitem.map((item) {
      return OrderItem(
        productId: item.product.id,
        price: item.product.price,
        quantity: item.quantity,
        title: item.product.title,
      );
    }).toList();
    return Order(
      orderitem: orderItems,
      totalPrice: totalPrice,
      totalQuantity: totalQuantity,
      address: checkout.address,
      phoneNummber: checkout.phoneNumber,
    );
  }
}
