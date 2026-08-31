part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState{}
final class CategorySuccess extends CategoryState{
  final List<Category> getcategories;

  CategorySuccess({required this.getcategories});

}
final class CategoryError extends CategoryState{
  final String message;

  CategoryError({required this.message});

}
