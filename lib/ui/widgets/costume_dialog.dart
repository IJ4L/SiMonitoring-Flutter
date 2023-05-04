import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/themes.dart';
import 'costume_button.dart';

class Dialoginfo extends StatelessWidget {
  const Dialoginfo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 320.r,
        width: 320.r,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            SvgPicture.asset(
              "assets/icons/Succes.svg",
              width: 150.r,
              height: 150.r,
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: kTextInfoColor,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 60.w,
              ),
              child: Costumebutton(
                title: 'Continue',
                ontap: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home-mahasiswa',
                  (route) => false,
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
    );
  }
}
