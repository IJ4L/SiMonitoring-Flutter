import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/themes.dart';

class CostumeCardMhs extends StatelessWidget {
  const CostumeCardMhs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48.r,
          width: 48.r,
          margin: EdgeInsets.only(right: 20.w),
          decoration: BoxDecoration(
            border: Border.all(color: kBlackColor, width: 2),
            borderRadius: BorderRadius.circular(54.h / 2),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmad Ilham',
              style: TextStyle(
                fontWeight: medium,
                fontSize: 16.sp,
              ),
              textScaleFactor: 1,
            ),
            SizedBox(height: 6.h),
            Text(
              '60900121070',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: light,
                fontStyle: FontStyle.italic,
              ),
              textScaleFactor: 1,
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset(
          "assets/icons/check_box_on.svg",
          width: 28.r,
          height: 28.r,
          fit: BoxFit.fill,
        ),
        SizedBox(width: 6.h),
        SvgPicture.asset(
          "assets/icons/check_box_off.svg",
          width: 28.r,
          height: 28.r,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
