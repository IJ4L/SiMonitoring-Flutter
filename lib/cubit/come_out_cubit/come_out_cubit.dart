import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'come_out_state.dart';

class ComeOutCubit extends Cubit<ComeOutState> {
  ComeOutCubit() : super(ComeOutInitial());
}
