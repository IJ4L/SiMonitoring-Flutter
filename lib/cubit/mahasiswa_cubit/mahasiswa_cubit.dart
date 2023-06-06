import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/models/kegiatan_model.dart';
import 'package:simor/services/mahasiswa_repository.dart';

import '../../models/kendala_model.dart';

part 'mahasiswa_state.dart';

class MahasiswaCubit extends Cubit<MahasiswaState> {
  final MahasiswaRepository mahasiswaRepository;
  MahasiswaCubit(this.mahasiswaRepository) : super(MahasiswaInitial());

  Future<void> datang(String imagePath) async {
    emit(MahasiswaLoading());
    final result = await mahasiswaRepository.datang(imagePath);

    result.fold((error) => emit(MahasiswaFailure(error)), (success) => null);
  }

  Future<void> saveKegiatan(KegiatanModel newKegiatan) async {
    await mahasiswaRepository.saveKegiatan(newKegiatan);
  }

  Future<void> getKegiatan() async {
    final result = await mahasiswaRepository.getKegiatan();
    emit(MahasiswaGetkegiatan(result));
  }

  Future<void> kirimKendala(String kendala) async {
    final result = await mahasiswaRepository.postKendala(kendala);
    result.fold((erorr) => emit(MahasiswaFailure(erorr)), (r) => null);
  }

  Future<void> cekKendala() async {
    final result = await mahasiswaRepository.getKendala();
    result.fold(
      (erorr) => emit(MahasiswaFailure(erorr)),
      (success) => emit(MahasiswaGetKendala(success)),
    );
  }

  @override
  void onChange(Change<MahasiswaState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
