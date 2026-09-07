import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/cart/presentation/bloc/cart_item_bloc.dart';
import 'package:stylish/feathers/cart/presentation/bloc/cart_item_event.dart';
import 'package:stylish/feathers/cart/presentation/bloc/cart_item_state.dart';

class CartitemWidget extends StatelessWidget {
  const CartitemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemBloc, CartItemState>(
      builder: (context, state) {
        if (state is CartItemLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CartItemSuccess) {
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final item = state.items[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(item.product.images[1]),
                        Column(
                          children: [
                            Text(item.product.title),
                            Text(item.product.rate.toString()),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(item.product.price.toString()),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context.read<CartItemBloc>().add(
                                      IncreaseQuantityCartItemEvent(
                                        productId: item.product.id,
                                      ),
                                    );
                                  },
                                  icon: Icon(CupertinoIcons.add),
                                ),
                                Text('${item.quantity}'),
                                IconButton(
                                  onPressed: () {
                                    context.read<CartItemBloc>().add(
                                      DecreaseQuantityCartItemEvent(
                                        productId: item.product.id,
                                      ),
                                    );
                                  },
                                  icon: Icon(CupertinoIcons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Order (${state.totalQuantity}) :'),
                        Text(state.totalprice.toString()),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        if (state is CartItemError) {
          return Center(child: Text(state.message));
        }
        return SizedBox();
      },
    );
  }
}
