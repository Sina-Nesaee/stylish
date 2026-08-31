part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}
class AddressChangedEvent extends CheckoutEvent{
  final String address;

  AddressChangedEvent({required this.address});
}
class PhoneNumberChangedEvent extends CheckoutEvent{
  final String phoneNumber;

  PhoneNumberChangedEvent({required this.phoneNumber});
}
class ValidationCheckoutEvent extends CheckoutEvent{}
