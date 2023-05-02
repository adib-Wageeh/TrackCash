import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'change_category_state.dart';

class ChangeCategoryCubit extends Cubit<ChangeCategoryState> {

  ChangeCategoryCubit() : super(ChangeCategoryInitial());

  int categoryIndex = 0;


  void onCategoryChange({int newCategoryIndex=0}){

    categoryIndex = newCategoryIndex;
    emit(ChangeCategoryLoading());
    emit(ChangeCategoryLoaded(categoryIndex: newCategoryIndex));
  }

}
