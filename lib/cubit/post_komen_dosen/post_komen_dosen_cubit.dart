import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/dosen_repository.dart';

part 'post_komen_dosen_state.dart';

class PostKomenDosenCubit extends Cubit<PostKomenDosenState> {
  final DosenRepository dosenRepository;

  PostKomenDosenCubit(this.dosenRepository) : super(PostKomenDosenInitial());

  void postKomen(String komen, String kendalaId) async {
    emit(PostKomenDosenLoading());

    final result = await dosenRepository.postKomen(komen, kendalaId);
    result.fold(
      (l) => emit(PostKomenDosenInvalid()),
      (r) => emit(PostKomenDosenLoaded()),
    );
  }
}
