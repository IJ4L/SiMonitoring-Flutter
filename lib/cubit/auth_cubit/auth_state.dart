part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthMahsiswa extends AuthState {
  final MahasiswaModel mahasiswaModel;

  const AuthMahsiswa(this.mahasiswaModel);

  @override
  List<Object> get props => [mahasiswaModel];
}

class AuthDosen extends AuthState {
  final DosenPembimbinfModel dosenModle;

  const AuthDosen(this.dosenModle);

  @override
  List<Object> get props => [dosenModle];
}

class AuthPembimbing extends AuthState {
  final DosenPembimbinfModel pembimbing;

  const AuthPembimbing(this.pembimbing);

  @override
  List<Object> get props => [pembimbing];
}

class AuthFailed extends AuthState {
  final String message;

  const AuthFailed(this.message);

  @override
  List<Object> get props => [message];
}
