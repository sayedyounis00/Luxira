import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/core/utils/style/text_styles.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/custom_text_feild.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/auth/data/repo/auth_repo.dart';
import 'package:luxira/features/auth/data/repo/auth_repo_implemtion.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthRepo authRepo = AuthRepoImplemtion();
  TextEditingController newPasswordcon = TextEditingController();
  TextEditingController confirmPasswordcon = TextEditingController();
  var myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: myKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Reset Password',
                        style: TextStyles.font32Weight500colorBlack,
                      ),
                    ),
                  ],
                ),
                const SpaceV(10),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.password, size: 50),
                ),
                const SpaceV(10),
                AppTextFeild(
                    hintText: 'New Password',
                    controller: newPasswordcon,
                    prefixIcon: const Icon(FontAwesomeIcons.lock),
                    upText: 'new password',
                    validator: (val) {
                      if (newPasswordcon.text.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    }),
                AppTextFeild(
                    hintText: 'Confirn Password',
                    controller: confirmPasswordcon,
                    prefixIcon: const Icon(FontAwesomeIcons.lock),
                    upText: 'confirm password',
                    validator: (val) {
                      if (confirmPasswordcon.text.isEmpty) {
                        return 'Confirm password first';
                      }
                      return null;
                    }),
                const SpaceV(20),
                AppCustomButton(
                  onTap: () {
                    if (myKey.currentState!.validate()) {
                      //!resetPassword repo
                      //!await func.then();
                      Navigator.pushNamed(
                        context,
                        AppRouter.resetDone,
                      );
                    }
                  },
                  buttonWidget: Text(
                    'Reset Password',
                    style: TextStyles.font20Weight500white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
