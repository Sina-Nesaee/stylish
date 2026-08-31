import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/feathers/category/domain/entities/categories.dart';
import 'package:stylish/feathers/category/domain/usecase/getCategories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final Getcategories getcategories;
  CategoryBloc(this.getcategories) : super(CategoryInitial()) {
    on<CategoryEvent>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    CategoryEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final categories = await getcategories();
      emit(CategorySuccess(getcategories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
