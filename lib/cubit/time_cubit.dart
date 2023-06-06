import 'package:bloc/bloc.dart';

class TimeCubit extends Cubit<List<String>> {
  TimeCubit() : super([]);

  void addTime(String timePick, int index) {
    List<String> updatedTime = List.from(state);

    if (index >= updatedTime.length) {
      for (int i = updatedTime.length; i <= index; i++) {
        if (i == index) {
          updatedTime.add(timePick);
        } else {
          updatedTime.add('');
        }
      }
    } else {
      updatedTime[index] = timePick;
    }
    emit(updatedTime);
  }

  void addnew() {
    List<String> updatedTime = List.from(state);
    updatedTime.add('');
    emit(updatedTime);
  }
}
