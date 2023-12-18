import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/models/komen_dosen_model.dart';
import 'package:simor/services/dosen_repository.dart';

part 'komen_dosen_state.dart';

class KomenDosenCubit extends Cubit<KomenDosenState> {
  final DosenRepository dosenRepository;

  KomenDosenCubit(this.dosenRepository) : super(KomenDosenInitial());

  Future<void> getKomenDosen() async {
    emit(KomenDosenLoading());
    final result = await dosenRepository.getKendalaKomenMhs();


    result.fold(
      (l) => emit(KomenDosenError(message: l)),
      (r) => emit(KomenDosenLoaded(komenDosenModel: r)),
    );
  }
}
