import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/themes.dart';

class FormInputKegiatan extends StatelessWidget {
  const FormInputKegiatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deskripsi Kegiatan:',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextInfoColor,
                ),
                textScaleFactor: 1,
              ),
              Container(
                height: 24.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: kSecondColor,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/icons/clock.png",
                      height: 14.r,
                      width: 14.r,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Pilih Waktu",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 12.sp,
                      ),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          TextFormField(
            maxLines: 5,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
              hintStyle: TextStyle(
                color: kGreyColor.withOpacity(0.4),
                fontStyle: FontStyle.italic,
                fontSize: 12.sp,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: kTextInfoColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: kTextInfoColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
