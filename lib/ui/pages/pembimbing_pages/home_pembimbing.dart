import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/shared/themes.dart';

class Homepembimbing extends StatelessWidget {
  const Homepembimbing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/backgorund.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 55.h,
                  width: 202.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64.h,
                  height: 64.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(64.h),
                    border: Border.all(color: kBlackColor, width: 2),
                  ),
                ),
                SizedBox(width: 22.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Makassar Digital Valley',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.0,
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        'Jl. A. P. Pettarani No.13, Sinrijala, Kec. Panakkukang, Kota Makassar',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textScaleFactor: 1.0,
                        maxLines: 4,
                      ),
                    ),
                    Container(
                      height: 0.4.h,
                      width: 230.w,
                      margin: EdgeInsets.only(top: 10.h),
                      decoration: BoxDecoration(
                        color: kBlackColor.withOpacity(0.1),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Dosen Pembimbing',
                      style: TextStyle(fontSize: 8.sp),
                      textScaleFactor: 1.0,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Reza Maulana',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.0,
                    ),
                  ],
                ),
                Container(
                  height: 24.h,
                  width: 0.4.w,
                  decoration: BoxDecoration(
                    color: kBlackColor.withOpacity(0.1),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Pembimbing Lapangan',
                      style: TextStyle(fontSize: 8.sp),
                      textScaleFactor: 1.0,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Rini Apriliani',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textScaleFactor: 1.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
