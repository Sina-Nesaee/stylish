import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/product/domain/usecase/get_Product_By_Id.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetproductById getproductbyid;

  ProductDetailBloc({required this.getproductbyid}) : super(ProductInitial()) {
    on<GetProductByIdEvent>(_onGetProductById);
  }

  Future<void> _onGetProductById(
    GetProductByIdEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailLoading());
    try {
      final product = await getproductbyid(event.id);
      emit(ProductDetailLoaded(product: product));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
