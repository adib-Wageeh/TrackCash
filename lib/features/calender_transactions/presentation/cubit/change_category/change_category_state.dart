part of 'change_category_cubit.dart';

@immutable
abstract class ChangeCategoryState {}

class ChangeCategoryInitial extends ChangeCategoryState {}

class ChangeCategoryLoading extends ChangeCategoryState {}

class ChangeCategoryLoaded extends ChangeCategoryState {

  final int categoryIndex;
  ChangeCategoryLoaded({required this.categoryIndex});
}
