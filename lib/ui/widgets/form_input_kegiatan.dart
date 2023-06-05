import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/time_cubit.dart';
import '../../shared/themes.dart';

class FormInputKegiatan extends StatefulWidget {
  const FormInputKegiatan({
    Key? key,
    required this.title,
    required this.wrong,
    this.waktu = true,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final String title, wrong;
  final bool waktu;
  final TextEditingController controller;
  final int index;

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
                            BlocBuilder<TimeCubit, List<String>>(
                              builder: (context, state) {
                                return Text(
                                  state[widget.index] == ''
                                      ? "Pilih Waktu"
                                      : state[widget.index],
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 12.sp,
                                  ),
                                  textScaleFactor: 1,
                                );
                              },
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
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? pickeds = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (pickeds != null) {
      final String formattedTime = pickeds.toString().substring(11, 15);
      // ignore: use_build_context_synchronously
      context.read<TimeCubit>().addTime(formattedTime, widget.index);
    }
  }
}
