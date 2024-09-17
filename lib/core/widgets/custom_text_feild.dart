import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/constants/colors.dart';

class AppTextFeild extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final String upText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?) validator;

  const AppTextFeild(
      {super.key,
      required this.hintText,
      this.keyboardType,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      required this.upText,
      this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: Text(
            upText,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        TextFormField(
          obscureText: obscureText ?? false,
          validator:validator,
          enabled: true,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            //enabledBorder
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0.r),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.3.w,
              ),
            ),
            //focusedBorder
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.kPrimaryColor,
                width: 1.3.w,
              ),
            ),
            //errorBorder
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            // /focusedErrorBorder
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.3.w,
              ),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
          ),
        ),
      ],
    );
  }
}
