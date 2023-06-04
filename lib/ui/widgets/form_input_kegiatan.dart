import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/themes.dart';

class FormInputKegiatan extends StatefulWidget {
  FormInputKegiatan({
    Key? key,
    required this.title,
    required this.wrong,
    this.waktu = true,
    required this.controller,
    required this.time,
  }) : super(key: key);

  final String title, wrong;
  final bool waktu;
  final TextEditingController controller;
  late final String time;

  @override
  State<FormInputKegiatan> createState() => _FormInputKegiatanState();
}

class _FormInputKegiatanState extends State<FormInputKegiatan> {
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
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kTextInfoColor,
                ),
                textScaleFactor: 1,
              ),
              widget.waktu == true
                  ? GestureDetector(
                      onTap: () => _showTimePicker(context),
                      child: Container(
                        height: 24.h,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: kSecondColor,
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              widget.time,
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 12.sp,
                              ),
                              textScaleFactor: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: widget.controller,
            maxLines: 7,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: widget.wrong,
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

  void _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'Pilih Waktu',
    );

    if (pickedTime != null) {
      final String formattedTime = pickedTime.toString().substring(11, 15);
      setState(() {
        widget.time = formattedTime;
        print(widget.time);
      });
    }
  }
}
