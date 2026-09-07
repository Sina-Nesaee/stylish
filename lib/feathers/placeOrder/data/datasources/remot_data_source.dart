
import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';

abstract class OrderRemotDataSource {
  Future<void> placeOrder(Order order);
}