import 'package:stylish/feathers/checkout/domain/entities/checkout_entity.dart';

class ValidationCheckoutUsecase {
  String? call(CheckoutEntity checkout){
    if(checkout.address.trim().isEmpty){
      return 'address is required';
    }
    if(checkout.phoneNumber.trim().isEmpty){
      return 'phoneNumber is required';
    }
    return null;
  }
}