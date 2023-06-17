import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/dosen_repository.dart';

import '../../models/lokasimhs_model.dart';

part 'lokasi_state.dart';

class LokasiCubit extends Cubit<LokasiState> {
  final DosenRepository dosenRepository;
  LokasiCubit({required this.dosenRepository}) : super(LokasiInitial());

  Future<void> getMahasiswaByLokasi(String tanggal) async {
    emit(LokasiLoading());
    final result = await dosenRepository.getByLokasi(tanggal);
    result.fold(
      (erorr) => emit(LokasiFailure(erorr)),
      (success) {
        emit(LokasiLoaded(success));
      },
    );
  }

  @override
  void onChange(Change<LokasiState> change) {
    super.onChange(change);
    print(change);
  }
}
