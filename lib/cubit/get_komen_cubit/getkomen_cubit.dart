import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/models/komen_model.dart';
import 'package:simor/services/mahasiswa_repository.dart';

part 'getkomen_state.dart';

class GetkomenCubit extends Cubit<GetkomenState> {
  final MahasiswaRepository mahasiswaRepository;

  GetkomenCubit(this.mahasiswaRepository) : super(GetkomenInitial());

  Future<void> getKomen() async {
    emit(GetkomenLoading());
    final data = await mahasiswaRepository.getKomen();

    data.fold(
      (error) => emit(GetkomenError(message: error)),
      (succes) => emit(GetkomenLoaded(komen: succes)),
    );
  }
}
