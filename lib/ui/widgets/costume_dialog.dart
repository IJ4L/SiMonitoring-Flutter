import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: 330.r,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Image.asset(
              "assets/icons/Succes.png",
              width: 150.r,
              height: 150.r,
              fit: BoxFit.fill,
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
                ontap: () => Navigator.pushNamed(context, '/home-mahasiswa'),
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
