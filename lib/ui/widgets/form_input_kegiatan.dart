import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/themes.dart';

class FormInputKegiatan extends StatelessWidget {
  const FormInputKegiatan({
    super.key,
    required this.title,
    required this.wrong,
    this.waktu = true,
  });

  final String title, wrong;
  final bool waktu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kTextInfoColor,
                ),
                textScaleFactor: 1,
              ),
              waktu == true
                  ? Container(
                      height: 24.h,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: kSecondColor,
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/clock.svg",
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
                  : Container(),
            ],
          ),
          SizedBox(height: 16.h),
          TextFormField(
            maxLines: 7,
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
