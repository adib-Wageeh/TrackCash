import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animate_container_state.dart';

class AnimateContainerCubit extends Cubit<AnimateContainerState> {
  AnimateContainerCubit() : super(AnimateContainerInitial());

  bool isDetails = false;
  bool isEditing = false;
  int pressedIndex = -1;

  void startDetails(int index){
    if(index == pressedIndex){
      isDetails = false;
      pressedIndex = -1;
      emit(AnimateContainerInitial());
    }else {
      isDetails = true;
      pressedIndex = index;
    }
    emit(AnimateContainerDetails());
  }

  void startEditing(int index){
    if(index == pressedIndex && isDetails != true){
      isEditing = false;
      pressedIndex = -1;
    }else {
      isEditing = true;
      isDetails = false;
      pressedIndex = index;
    }
    emit(AnimateContainerEdit());
  }


  double getHeight(int index){

    if(index == pressedIndex) {
      if (isDetails) {
        return 150;
      } else if (isEditing) {
        return 300;
      }
    }
    return 50;
  }

}
