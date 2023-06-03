import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/models/datang_model.dart';
import 'package:simor/services/status_repository.dart';

part 'come_out_state.dart';

class ComeOutCubit extends Cubit<ComeOutState> {
  final StatusRepository statusRepository;

  ComeOutCubit(this.statusRepository) : super(ComeOutInitial());

  Future<void> checkDatang() async {
    emit(ComeOutLoading());
    final result = await statusRepository.checkDatang();
    result.fold(
      (failed) => emit(ComeOutFailure()),
      (success) => emit(ComeOutDatang(datangModel: success)),
    );
  }

  @override
  void onChange(Change<ComeOutState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
