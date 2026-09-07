
import 'package:stylish/feathers/placeorder/data/datasources/remot_data_source.dart';
import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';

import 'package:stylish/feathers/placeorder/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository{
  final OrderRemotDataSource remotDataSource;

  OrderRepositoryImpl({required this.remotDataSource});

  @override
  Future<void> placeOrder(Order order) async{
   return await remotDataSource.placeOrder(order);
  }
  
}