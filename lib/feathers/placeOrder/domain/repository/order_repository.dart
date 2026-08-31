import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';

abstract class OrderRepository {
  Future<void> placeOrder(Order order);
}