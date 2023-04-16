import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/obscure_text.dart';

class TextfieldMaker extends StatelessWidget {
  const TextfieldMaker({
    super.key,
    required this.title,
    this.obscure = false,
    this.icon = Icons.visibility,
    this.showIcon = false,
  });

  final String title;
  final bool obscure, showIcon;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            textScaleFactor: 1.0,
          ),
        ),
        TextField(
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: 'Masukkan $title',
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: showIcon
                ? GestureDetector(
                    onTap: () {
                      context.read<ObscureTextCubit>().toggleObscure();
                    },
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
