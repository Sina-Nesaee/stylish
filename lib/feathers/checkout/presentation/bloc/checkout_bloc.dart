import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/checkout/domain/entities/checkout_entity.dart';
import 'package:stylish/feathers/checkout/domain/usecases/validation_checkout_usecase.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final ValidationCheckoutUsecase validationCheckoutUsecase;
  String address = '';
  String phoneNumber = '';
  CheckoutBloc(this.validationCheckoutUsecase) : super(CheckoutInitial()) {
    on<ValidationCheckoutEvent>(_validationCheckout);
    on<AddressChangedEvent>(_addressChanged);
    on<PhoneNumberChangedEvent>(_phoneNumberChanged);
  }
  void _validationCheckout(
    ValidationCheckoutEvent event,
    Emitter<CheckoutState> emit,
  ) {
    emit(CheckoutInitial());

    final CheckoutEntity checkout = CheckoutEntity(
      address: address,
      phoneNumber: phoneNumber,
    );
    final error = validationCheckoutUsecase(checkout);
    if (error != null) {
      emit(CheckoutError(message: error));
      return;
    }
    emit(CheckoutValid());
  }

  void _addressChanged(AddressChangedEvent event, Emitter<CheckoutState> emit) {
    address = event.address;
  }

  void _phoneNumberChanged(
    PhoneNumberChangedEvent event,
    Emitter<CheckoutState> emit,
  ) {
    phoneNumber = event.phoneNumber;
  }

  CheckoutEntity get checkout {
    return CheckoutEntity(address: address, phoneNumber: phoneNumber);
  }
}
