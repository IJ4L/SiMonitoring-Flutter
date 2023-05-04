import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/shared/themes.dart';
import 'package:simor/ui/widgets/costume_button.dart';

import '../../../cubit/camera_cubit/camera_cubit.dart';
import '../../widgets/costume_dialog.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraCubit>(
      create: (_) => CameraCubit()..initializeCamera(),
      child: Scaffold(
        body: BlocBuilder<CameraCubit, CameraState>(
          builder: (context, state) {
            if (state is CameraReady) {
              final cameraController = state.controller;
              final size = MediaQuery.of(context).size;
              cameraController.setFlashMode(FlashMode.off);
              return Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height,
                      child: AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(cameraController),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: GestureDetector(
                          onTap: () {
                            context.read<CameraCubit>().takePicture();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/button_camera.svg",
                            height: 60.r,
                            width: 60.r,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is CameraTakePicture) {
              return Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.file(
                      File(state.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 30.h,
                      ),
                      child: Costumebutton(
                        title: 'Kirim Foto',
                        colorTitle: kWhiteColor,
                        colorButton: kPrimaryColor,
                        ontap: () => showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return const Dialoginfo(
                              title: 'Foto Berhasil di kirim',
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
