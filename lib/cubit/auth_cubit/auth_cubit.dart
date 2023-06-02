import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/models/dosen_pembimbing_model.dart';
import 'package:simor/models/mahasiswa_model.dart';
import 'package:simor/services/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    final result = await authRepository.login(username, password);
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(AuthSuccess()),
    );
  }

  Future<String> getRole() async {
    emit(AuthLoading());
    final result = await authRepository.getRoleUser();
    return result;
  }

  Future<void> getDataMahasiswa() async {
    emit(AuthLoading());
    final result = await authRepository.getDataMahasiswa();
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(AuthMahsiswa(success)),
    );
  }

  Future<void> getDataDosen() async {
    emit(AuthLoading());
    final result = await authRepository.getDataDosenPembimbing();
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(AuthDosen(success)),
    );
  }

  Future<void> getDataPembimbing() async {
    emit(AuthLoading());
    final result = await authRepository.getDataDosenPembimbing();
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(AuthPembimbing(success)),
    );
  }

  // Future<void> checkDatang() async {
  //   emit(AuthLoading());
  //   final result = await authRepository.checkDatang();
  //   result.fold(
  //     (failed) => emit(AuthFailed(failed)),
  //     (success) => emit(AuthSuccess()),
  //   );
  // }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
