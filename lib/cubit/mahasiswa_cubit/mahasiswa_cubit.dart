import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/services/mahasiswa_repository.dart';

part 'mahasiswa_state.dart';

class MahasiswaCubit extends Cubit<MahasiswaState> {
  final MahasiswaRepository mahasiswaRepository;
  MahasiswaCubit(this.mahasiswaRepository) : super(MahasiswaInitial());

  Future<void> datang(String imagePath) async {
    emit(MahasiswaLoading());
    final result = await mahasiswaRepository.datang(imagePath);

    result.fold(
      (error) => emit(MahasiswaFailure(error)),
      (success) {},
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
