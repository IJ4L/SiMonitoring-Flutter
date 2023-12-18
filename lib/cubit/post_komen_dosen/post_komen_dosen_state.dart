part of 'post_komen_dosen_cubit.dart';

sealed class PostKomenDosenState extends Equatable {
  const PostKomenDosenState();

  @override
  List<Object> get props => [];
}

final class PostKomenDosenInitial extends PostKomenDosenState {}

final class PostKomenDosenLoading extends PostKomenDosenState {}

final class PostKomenDosenLoaded extends PostKomenDosenState {}

final class PostKomenDosenInvalid extends PostKomenDosenState {}
