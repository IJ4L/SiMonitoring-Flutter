import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/shared/themes.dart';

Future<void> dialogAbsen(BuildContext context, String status) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 445.h,
          width: 320.w,
          padding: EdgeInsets.all(20.r),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Verifikasi Data',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textScaleFactor: 1.0,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/back.svg",
                      width: 12.w,
                      height: 12.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Text(
                    'Pastikan Foto Pada Kartu Sesuai Dengan\nWajah Asli Mahasiswa',
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: 11.sp,
                      height: 1.6,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ],
              ),
              Container(
                height: 146.r,
                width: 146.r,
                padding: const EdgeInsets.all(3.7),
                margin: EdgeInsets.only(top: 24.h, bottom: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 4.62.w),
                  borderRadius: BorderRadius.circular(146.h / 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(146.w / 2),
                ),
              ),
              Text(
                'AHMAD ILHAM',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
                textScaleFactor: 1.0,
              ),
              SizedBox(height: 2.h),
              Text(
                '60900121070',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
                textScaleFactor: 1.0,
              ),
              Container(
                height: 44.h,
                width: 190.w,
                margin: EdgeInsets.only(top: 23.h),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Center(
                  child: Text(
                    status == 'Datang'
                        ? 'Konfirmasi Kehadiran'
                        : 'Logout Mahasiswa',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                    textScaleFactor: 1.0,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 44.h,
                  width: 190.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Center(
                    child: Text(
                      'Batal',
                      style: blueTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                      textScaleFactor: 1.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
