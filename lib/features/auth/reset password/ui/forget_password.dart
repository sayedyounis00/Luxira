import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luxira/core/utils/style/text_styles.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/custom_text_feild.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/auth/reset%20password/data/services/reset_password.dart';
import 'package:luxira/features/auth/verification.dart/ui/verification_view.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailcontroller = TextEditingController();
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
                        'Forget Password',
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
                  child: const Icon(Icons.fingerprint, size: 50),
                ),
                const SpaceV(10),
                AppTextFeild(
                    hintText: 'Enter your email',
                    controller: emailcontroller,
                    prefixIcon: const Icon(FontAwesomeIcons.envelope),
                    upText: 'Email',
                    validator: (val) {
                      //! need to check if email is exist in data base or not
                      if (emailcontroller.text.isEmpty) {
                        return 'Enter your email first';
                      }
                      return null;
                    }),
                const SpaceV(20),
                AppCustomButton(
                  onTap: () {
                    if (myKey.currentState!.validate()) {
                      //! need to check if email is exist in data base or not
                      ResetPassword().sentNewCodeToResetPAssword(emailcontroller.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerificationView(email:emailcontroller.text ,)));
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
