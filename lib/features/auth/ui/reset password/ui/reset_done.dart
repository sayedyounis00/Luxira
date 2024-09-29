import 'package:flutter/material.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/core/utils/style/text_styles.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';

class ResetDone extends StatelessWidget {
  const ResetDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                child: Image.asset(
              'assets/images/done.png',
              cacheHeight: 200,
            )),
            Text(
              'Password Update',
              style: TextStyles.font32Weight500colorBlack,
            ),
            Text(
              'your password has been changed successfully Use your new password to log in',
              style: TextStyles.font12Weight500Grey,
              textAlign: TextAlign.center,
            ),
            AppCustomButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRouter.loginPage);
                },
                buttonWidget: Text(
                  'Done',
                  style: TextStyles.font20Weight500white,
                ))
          ],
        ),
      ),
    );
  }
}
