import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/cart/domain/Entity/cart_Item.dart';
import 'package:stylish/feathers/cart/domain/usecase/Add_To_cart.dart';
import 'package:stylish/feathers/cart/domain/usecase/Decrease_Quantity.dart';
import 'package:stylish/feathers/cart/domain/usecase/Get_Cart_Item.dart';
import 'package:stylish/feathers/cart/domain/usecase/Increase_Quantity.dart';
import 'package:stylish/feathers/cart/domain/usecase/Remove_From_Cart.dart';
import 'package:stylish/feathers/cart/domain/usecase/calculate_cart_price_total.dart';
import 'package:stylish/feathers/cart/domain/usecase/calculate_quantity_total.dart';

part 'cart_item_event.dart';
part 'cart_item_state.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  final AddToCart addToCart;
  final GetCartItem getCartItems;
  final DecreaseQuantity decreaseQuantity;
  final IncreaseQuantity increaseQuantity;
  final RemoveFromCart removeFromCart;
  final CalculateCartPriceTotal calculateCartPriceTotal;
  final CalculateQuantityTotal calculateQuantityTotal;
  CartItemBloc({
    required this.addToCart,
    required this.getCartItems,
    required this.decreaseQuantity,
    required this.increaseQuantity,
    required this.removeFromCart,
    required this.calculateCartPriceTotal,
    required this.calculateQuantityTotal,
  }) : super(CartItemInitial()) {
    on<GetCartItemEvent>(_getCartItem);
    on<AddToCartItemEvent>(_addToCartItem);
    on<RemoveFromCartItemEvent>(_removeFromCartItem);
    on<DecreaseQuantityCartItemEvent>(_decreaseQuantityCartItem);
    on<IncreaseQuantityCartItemEvent>(_increaseQuantityCartItem);
  }
  Future<void> _getCartItem(
    GetCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(CartItemLoading());
    try {
      await _cartItemSuccess(emit);
    } catch (e) {
      emit(CartItemError(message: e.toString()));
    }
  }

  Future<void> _addToCartItem(
    AddToCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(CartItemLoading());
    try {
      addToCart(event.item);
     await _cartItemSuccess(emit);
    } catch (e) {
      emit(CartItemError(message: e.toString()));
    }
  }

  Future<void> _removeFromCartItem(
    RemoveFromCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(CartItemLoading());
    try {
      removeFromCart(event.productId);
     await _cartItemSuccess(emit);
    } catch (e) {
      emit(CartItemError(message: e.toString()));
    }
  }

  Future<void> _decreaseQuantityCartItem(
    DecreaseQuantityCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(CartItemLoading());
    try {
      decreaseQuantity(event.productId);
     await _cartItemSuccess(emit);
    } catch (e) {
      emit(CartItemError(message: e.toString()));
    }
  }

  Future<void> _increaseQuantityCartItem(
    IncreaseQuantityCartItemEvent event,
    Emitter<CartItemState> emit,
  ) async {
    emit(CartItemLoading());
    try {
      increaseQuantity(event.productId);
     await _cartItemSuccess(emit);
    } catch (e) {
      emit(CartItemError(message: e.toString()));
    }
  }

 Future<void> _cartItemSuccess(Emitter<CartItemState> emit) async {
    final items = getCartItems();
    final totalprice = calculateCartPriceTotal(items);
    final totalQuantity = calculateQuantityTotal(items);
    emit(CartItemSuccess(
      items: items,
      totalprice: totalprice,
      totalQuantity: totalQuantity,
    ));
  }
}
