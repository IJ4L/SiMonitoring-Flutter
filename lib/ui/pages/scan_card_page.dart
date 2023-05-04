import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Scancard extends StatelessWidget {
  const Scancard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/home-mahasiswa'),
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
                  Image.asset(
                    "assets/images/bg_scan_2.png",
                    width: 320.w,
                    height: 153.h,
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
