part of 'dosen_cubit.dart';

abstract class DosenState extends Equatable {
  const DosenState();

  @override
  List<Object> get props => [];
}

class DosenInitial extends DosenState {}

class DosenLoading extends DosenState {}

class DosenLoaded extends DosenState {
  final List<LokasiModel> lokasi;
  const DosenLoaded({required this.lokasi});

  @override
  List<Object> get props => [lokasi];
}

class DosenFailure extends DosenState {
  final String message;
  const DosenFailure({required this.message});

  @override
  List<Object> get props => [message];
}
