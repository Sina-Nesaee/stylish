import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/checkout/presentation/bloc/checkout_bloc.dart';

class AddressDeleviry extends StatelessWidget {
  const AddressDeleviry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            context.read<CheckoutBloc>().add(
              AddressChangedEvent(address: value),
            );
          },
          decoration: InputDecoration(hintText: 'address'),
        ),
        TextField(
          onChanged: (value) {
            context.read<CheckoutBloc>().add(
              PhoneNumberChangedEvent(phoneNumber: value),
            );
          },
          decoration: InputDecoration(hintText: 'phoneNumber'),
        ),
      ],
    );
  }
}
