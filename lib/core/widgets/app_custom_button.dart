import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/constants/colors.dart';

class AppCustomButton extends StatelessWidget {
  final Function() onTap;
  final Widget buttonWidget;
  final double? height;
  const AppCustomButton({
    super.key,
    required this.onTap,
    required this.buttonWidget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 16.h),
        alignment: Alignment.center,
        height: height ?? 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: buttonWidget,
      ),
    );
  }
}
