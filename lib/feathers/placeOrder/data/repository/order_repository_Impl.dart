
import 'package:stylish/feathers/placeOrder/data/dataSource/remot_data_source.dart';
import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';

import 'package:stylish/feathers/placeOrder/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository{
  final OrderRemotDataSource remotDataSource;

  OrderRepositoryImpl({required this.remotDataSource});

  @override
  Future<void> placeOrder(Order order) async{
   return await remotDataSource.placeOrder(order);
  }
  
}