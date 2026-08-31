import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/placeOrder/domain/Entity/order.dart';
import 'package:stylish/feathers/placeOrder/domain/usecase/place_order_usecase.dart';

part 'place_order_event.dart';
part 'place_order_state.dart';

class PlaceOrderBloc extends Bloc<PlaceOrderEvent, PlaceOrderState> {
  final PlaceOrderUsecase placeOrderUsecase;
  PlaceOrderBloc(this.placeOrderUsecase) : super(PlaceOrderInitial()) {
    on<PlaceOrderButtonPressed>(_placeOrderSave);
  }
  Future<void> _placeOrderSave(
    PlaceOrderButtonPressed event,
    Emitter<PlaceOrderState> emit,
  ) async {
    emit(PlaceOrderLoading());
    try {
      await placeOrderUsecase(event.order);
      emit(PlaceOrderSuccess());
    } catch (e) {
      emit(PlaceOrderError(message: e.toString()));
    }
  }
}
