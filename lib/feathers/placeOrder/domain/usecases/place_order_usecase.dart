import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';
import 'package:stylish/feathers/placeorder/domain/repositories/order_repository.dart';

class PlaceOrderUsecase {
  final OrderRepository orderRepository;

  PlaceOrderUsecase({required this.orderRepository});
  Future<void> call(Order order)async{
   return  orderRepository.placeOrder(order);
  }
}