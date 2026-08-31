import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';

abstract class OrderRemotDataSource {
  Future<void> placeOrder(Order order);
}