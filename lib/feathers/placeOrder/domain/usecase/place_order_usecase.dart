import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';
import 'package:stylish/feathers/placeOrder/domain/repository/order_repository.dart';

class PlaceOrderUsecase {
  final OrderRepository orderRepository;

  PlaceOrderUsecase({required this.orderRepository});
  Future<void> call(Order order)async{
   return  orderRepository.placeOrder(order);
  }
}