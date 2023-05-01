import 'package:bloc/bloc.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit() : super(1);

  void increment() {
    if (state != 3) emit(state + 1);
  }

  void initial() => emit(1);
}
