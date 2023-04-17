import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/services/camera_service.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  late List<CameraDescription> cameras;
  late CameraController cameraController;

  Future<void> startCamera(int direction) async {
    emit(CameraLoading());

    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      emit(CameraReady());
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  Future<void> useCamera() async {
    emit(CameraLoading());

    try {
      await CameraService().initialize();
      emit(CameraReady());
    } catch (e) {
      print(e.toString());
    }
  }
}
