part of 'post_komen_cubit.dart';

sealed class PostKomenState extends Equatable {
  const PostKomenState();

  @override
  List<Object> get props => [];
}

final class PostKomenInitial extends PostKomenState {}

final class PostKomenLoading extends PostKomenState {}

final class PostKomenLoaded extends PostKomenState {}

final class PostKomenError extends PostKomenState {
  final String message;

  const PostKomenError({required this.message});

  @override
  List<Object> get props => [message];
}
