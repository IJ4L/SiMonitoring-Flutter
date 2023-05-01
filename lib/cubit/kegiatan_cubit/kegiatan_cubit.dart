import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kegiatan_state.dart';

class KegiatanCubit extends Cubit<KegiatanState> {
  KegiatanCubit() : super(KegiatanInitial());
}
