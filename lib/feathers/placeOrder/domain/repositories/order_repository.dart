
import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';

abstract class OrderRepository {
  Future<void> placeOrder(Order order);
}