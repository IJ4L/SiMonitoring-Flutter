import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/dosen_repository.dart';

part 'get_kendala_dosen_state.dart';

class GetKendalaDosenCubit extends Cubit<GetKendalaDosenState> {

  final DosenRepository dosenRepository;

  GetKendalaDosenCubit(this.dosenRepository) : super(GetKendalaDosenInitial());

  Future<void> getKendala(String id) async {
    emit(GetKendalaDosenLoading());
    final result = await dosenRepository.getKendalaDosen(id);
    result.fold(
      (erorr) => emit(GetKendalaDosenError(message: erorr)),
      (success) => emit(GetKendalaDosenLoaded(kendala: success)),
    );
  }
}
