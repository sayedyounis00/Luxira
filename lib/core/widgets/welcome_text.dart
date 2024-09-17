import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Hi, Welcome To ',
          style: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          children: [
            TextSpan(
              text: 'Luxira!',
              style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0D4F71)),
            )
          ]),
    );
  }
}