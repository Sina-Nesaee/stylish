import 'package:stylish/feathers/placeOrder/domain/Entity/orderItem.dart';

class Order {
  final List<OrderItem> orderitem;
  final double totalPrice;
  final int totalQuantity;
  final String address;
  final String phoneNummber;

  Order({
    required this.orderitem,
    required this.totalPrice,
    required this.totalQuantity,
    required this.address,
    required this.phoneNummber, 
  });
}
