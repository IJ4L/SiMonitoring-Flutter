import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/shared/themes.dart';

import '../../cubit/auth_cubit/auth_cubit.dart';
import '../../cubit/loading_button_cubit.dart';
import '../../cubit/obscure_text_cubit.dart';
import '../widgets/costume_button.dart';
import '../widgets/form_input_with_title.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthMahsiswa) {
            Navigator.pushNamed(
              context,
              '/info-scan',
              arguments: {
                'title': 'Datang',
                'bg': 'bg_scan_1.svg',
                'card': 'bg_scan_In.svg',
              },
            );
          }
          if (state is AuthPembimbing) {
            Navigator.pushNamed(context, '/home-pembimbing');
          }
        },
        child: Stack(
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
                      TextfieldMaker(
                        title: 'Nim',
                        showIcon: false,
                        controller: usernameController,
                      ),
                      SizedBox(height: 16.h),
                      BlocBuilder<ObscureTextCubit, bool>(
                        builder: (context, state) {
                          return TextfieldMaker(
                            title: 'Password',
                            obscure: state,
                            showIcon: true,
                            icon:
                                state ? Icons.visibility : Icons.visibility_off,
                            controller: passwordController,
                          );
                        },
                      ),
                      SizedBox(height: 32.h),
                      BlocBuilder<LodingButtonCubit, bool>(
                        builder: (context, state) {
                          final authCubit = context.read<AuthCubit>();
                          return Costumebutton(
                            title: 'Login',
                            colorTitle: const Color(0xff2A55C9),
                            colorButton: Colors.white,
                            progres: state,
                            ontap: () async {
                              await authCubit.login(
                                usernameController.text,
                                passwordController.text,
                              );
                              final role = await authCubit.getRole();
                              if (role == 'mahasiswa') {
                                authCubit.getDataMahasiswa();
                              }
                              if (role == 'pembimbing_lapangan') {
                                authCubit.getDataPembimbing();
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
