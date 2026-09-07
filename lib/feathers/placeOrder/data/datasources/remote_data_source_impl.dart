

import 'package:dio/dio.dart';
import 'package:stylish/feathers/placeorder/data/datasources/remot_data_source.dart';
import 'package:stylish/feathers/placeorder/domain/entities/order_entity.dart';

class OrderRemoteDataSourceImpl implements OrderRemotDataSource {
  final Dio dio;

  OrderRemoteDataSourceImpl({required this.dio});
  @override
  Future<void> placeOrder(Order order) async {
    await dio.post(
      '/orders',
      data: {
        'orderitem': order.orderitem.map((item) {
          return {
            'productId': item.productId,
            'title': item.title,
            'price': item.price,
            'quantity': item.quantity,
          };
        }).toList(),

        'totalPrice': order.totalPrice,
        'totalQuantity': order.totalQuantity,
        'address': order.address,
        'phoneNumber': order.phoneNummber,
      },
    );
  }
}
