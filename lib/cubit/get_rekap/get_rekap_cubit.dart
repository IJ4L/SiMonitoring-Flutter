import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/dosen_repository.dart';

part 'get_rekap_state.dart';

class GetRekapCubit extends Cubit<GetRekapState> {
  final DosenRepository dosenRepository;

  GetRekapCubit(this.dosenRepository) : super(GetRekapInitial());

  Future<void> getRekap(String kendalaId) async {
    emit(GetRekapLoading());

    final result = await dosenRepository.getRekap(kendalaId);

    result.fold(
      (l) => emit(GetRekapError(l)),
      (r) => emit(GetRekapLoaded(r)),
    );
  }
}
