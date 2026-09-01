import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:stylish/feathers/placeOrder/presentation/bloc/place_order_bloc.dart';

class PlaceorderWidget extends StatelessWidget {
  const PlaceorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (BuildContext context, state) {
        final isLoading = state is PlaceOrderLoading;
        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
                  context.read<CheckoutBloc>().add(ValidationCheckoutEvent());
                },
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Text('place order'),
        );
      },
    );
  }
}
