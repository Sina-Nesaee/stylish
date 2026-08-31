part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
final class CheckoutValidating extends CheckoutState{}
final class CheckoutValid extends CheckoutState{}
final class CheckoutError extends CheckoutState{
  final String message;

  CheckoutError({required this.message});
}
