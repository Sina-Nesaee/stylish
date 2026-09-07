
import 'package:stylish/feathers/cart/domain/entities/cart_item_entity.dart';
import 'package:stylish/feathers/checkout/domain/entities/checkout_entity.dart';
import 'package:stylish/feathers/placeorder/domain/entities/orderItem_entity.dart';
import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';

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
