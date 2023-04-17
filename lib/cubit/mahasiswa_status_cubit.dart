import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'mahasiswa_status_state.dart';

class MahasiswaStatusCubit extends Cubit<MahasiswaStatusState> {
  MahasiswaStatusCubit() : super(MahasiswaStatusInitial());
}
