import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/auth_remote_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    final result = await authRepository.login(username, password);
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(Authuccess()),
    );
  }

  Future<void> getDataUser(String username, String password) async {
    emit(AuthLoading());
    final result = await authRepository.login(username, password);
    result.fold(
      (failed) => emit(AuthFailed(failed)),
      (success) => emit(Authuccess()),
    );
  }
}
