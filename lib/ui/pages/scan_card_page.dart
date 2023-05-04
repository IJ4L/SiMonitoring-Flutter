import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/costume_dialog.dart';

class Scancard extends StatelessWidget {
  const Scancard({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> typePage =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => typePage['type'] == true
            ? Navigator.pushNamed(context, '/home-mahasiswa')
            : showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return const Dialoginfo(
                    title:
                        'Rencana Kegiatan, Kendala,\ndan Absensi Anda Telah Terkirim.\n\nAnda Akan Logout Otomatis\nSelamat Istirahat!',
                    height: 370,
                  );
                },
              ),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg_scan_1.png",
              height: 202.h,
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 54.h,
                      width: 197.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  SvgPicture.asset(
                    typePage['type'] == true
                        ? "assets/images/bg_scan_In.svg"
                        : "assets/images/bg_scan_out.svg",
                    width: 300.w,
                    height: 140.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 45.h),
                  Text(
                    'Scan Kartu Anda!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                    textScaleFactor: 1,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/vector_scan.png",
                    width: 120.r,
                    height: 120.r,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 60.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Text(
                      'Silahkan Scan Kartu Anda Pada Perangkat Pembimbing Lapangan ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
