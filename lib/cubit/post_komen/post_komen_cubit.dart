import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/mahasiswa_repository.dart';

part 'post_komen_state.dart';

class PostKomenCubit extends Cubit<PostKomenState> {
  final MahasiswaRepository mahasiswaRepository;

  PostKomenCubit(this.mahasiswaRepository) : super(PostKomenInitial());

  Future<void> postKomen(String komen) async {
    emit(PostKomenLoading());
    final data = await mahasiswaRepository.postKomen(komen);


    data.fold(
      (l) => emit(PostKomenError(message: l)),
      (r) => emit(PostKomenLoaded()),
    );
  }
}
