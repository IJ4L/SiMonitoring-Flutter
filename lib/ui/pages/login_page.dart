import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/cubit/obscure_text_cubit.dart';
import 'package:simor/shared/themes.dart';

import '../../cubit/loading_button_cubit.dart';
import '../widgets/costume_button.dart';
import '../widgets/form_input_with_title.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgorund.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 54.h,
                      width: 197.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 56.h),
                    Text(
                      'MONITORING',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 46.sp,
                      ),
                      textScaleFactor: 1,
                    ),
                    Text(
                      'PRAKTEK PENGENALAN LAPANGAN',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: light,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 48.h),
                    const TextfieldMaker(
                      title: 'Nim',
                      showIcon: false,
                    ),
                    SizedBox(height: 16.h),
                    BlocProvider(
                      create: (context) => ObscureTextCubit(),
                      child: BlocBuilder<ObscureTextCubit, bool>(
                        builder: (context, isObscure) {
                          return TextfieldMaker(
                            title: 'Password',
                            obscure: isObscure,
                            showIcon: true,
                            icon: isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 32.h),
                    BlocProvider(
                      create: (context) => LodingButtonCubit(),
                      child: BlocBuilder<LodingButtonCubit, bool>(
                        builder: (context, isLoading) {
                          return Costumebutton(
                            title: 'Login',
                            colorTitle: const Color(0xff2A55C9),
                            colorButton: Colors.white,
                            progres: isLoading,
                            ontap: () => Navigator.pushReplacementNamed(
                              context,
                              '/scan-card',
                              arguments: {'type': true},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
