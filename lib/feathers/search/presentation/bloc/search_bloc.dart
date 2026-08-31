
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/product/domain/entities/product.dart';
import 'package:stylish/feathers/search/domain/usecase/search_product.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProduct searchProduct;

  SearchBloc(this.searchProduct) : super(SearchInitial()) {
    on<SearchProductEvent>(_onSearchProducts);
  }

  Future<void> _onSearchProducts(
   
    SearchProductEvent event,
    Emitter<SearchState> emit,
  ) async {
     if(event.query.trim().isEmpty){
      emit(SearchInitial());
     }
    emit(SearchLoading());
    try {
      final product = await searchProduct(event.query);
      emit(SearchSuccess(products: product));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
