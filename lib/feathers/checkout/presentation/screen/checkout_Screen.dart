import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/cart/presentation/bloc/cart_item_bloc.dart';
import 'package:stylish/feathers/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:stylish/feathers/checkout/presentation/widget/address_deleviry_widget.dart';
import 'package:stylish/feathers/checkout/presentation/widget/cartItem_widget.dart';
import 'package:stylish/feathers/checkout/presentation/widget/placeorder_widget.dart';
import 'package:stylish/feathers/home/presentaition/screen/home_page.dart';
import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';
import 'package:stylish/feathers/placeOrder/domain/usecase/creat_order_usecase.dart';
import 'package:stylish/feathers/placeOrder/presentation/bloc/place_order_bloc.dart';

class CheckoutProvider extends StatelessWidget {
  const CheckoutProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CheckoutBloc>()),
        BlocProvider(
          create: (context) => getIt<CartItemBloc>()..add(GetCartItemEvent()),
        ),
        BlocProvider(create: (context) => getIt<PlaceOrderBloc>()),
      ],
      child: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CheckoutBloc, CheckoutState>(
          listener: (BuildContext context, state) {
            if (state is CheckoutValid) {
              _creatAndPlaceorder(context);
            }
            if (state is CheckoutError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
        BlocListener<PlaceOrderBloc, PlaceOrderState>(
          listener: (BuildContext context, PlaceOrderState state) {
            if (state is PlaceOrderLoading) {}
            if (state is PlaceOrderSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            if (state is PlaceOrderError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Checkout')),
        body: Column(
          children: [
            Row(
              children: [
                Icon(CupertinoIcons.location),
                Text('Delivery Address'),
              ],
            ),
            AddressDeleviry(),
            Text('Shopping List'),
            CartitemWidget(),
            PlaceorderWidget(),
          ],
        ),
      ),
    );
  }

  void _creatAndPlaceorder(BuildContext context) {
    final cartstate = context.read<CartItemBloc>().state;
    if (cartstate is! CartItemSuccess) {
      return;
    }
    final checkout = context.read<CheckoutBloc>().checkout;
    final order = getIt<CreatOrderUsecase>()(
      checkout: checkout,
      orderitem: cartstate.items,
      totalPrice: cartstate.totalprice,
      totalQuantity: cartstate.totalQuantity,
    );
    context.read<PlaceOrderBloc>().add(PlaceOrderButtonPressed(order: order));
  }
}
