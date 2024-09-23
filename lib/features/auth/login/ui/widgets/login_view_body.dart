import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luxira/core/helper/validation/form_validation.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/core/utils/style/text_styles.dart';
import 'package:luxira/core/widgets/app_alert_dialog.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/custom_text_feild.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/core/widgets/welcome_text.dart';
import 'package:luxira/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:luxira/features/auth/login/ui/widgets/redirect_to_register.dart';
import 'package:luxira/features/auth/login/ui/widgets/sign_with_google.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isVisable = false;
  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  var myKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailcont.clear();
    passwordcont.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.h),
      child: Form(
        key: myKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceV(200),
            const WelcomeText(),
            const RedirectToRegister(),
            AppTextFeild(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return FormValidation.validator(
                    upText: 'email address',
                    errmessage: 'email reqired ',
                    val: value!);
              },
              upText: 'email address',
              hintText: 'john@mail.com',
              controller: emailcont,
              prefixIcon: const Icon(FontAwesomeIcons.envelope),
            ),
            AppTextFeild(
              validator: (value) {
                return FormValidation.validator(
                    upText: 'Password',
                    errmessage: 'password reqired',
                    val: value!);
              },
              obscureText: !isVisable,
              upText: 'Password',
              hintText: '********',
              controller: passwordcont,
              prefixIcon: const Icon(
                FontAwesomeIcons.lock,
                size: 20,
              ),
              suffixIcon: IconButton(
                icon: isVisable
                    ? const Icon(
                        FontAwesomeIcons.eye,
                        size: 20,
                      )
                    : const Icon(
                        FontAwesomeIcons.eyeLowVision,
                        size: 20,
                      ),
                onPressed: () {
                  isVisable = !isVisable;
                  setState(() {
                    log('message');
                  });
                },
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AppCustomButton(
                  onTap: () {
                    if (myKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).login(
                          email: emailcont.text, password: passwordcont.text);
                      if (state is LoginSuccess) {
                        Navigator.pushNamed(context, AppRouter.homePage);
                      }
                      if (state is LoginFailed) {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AppAlertDialog(
                              title: 'Login Faild',
                              content: Text(state.erroeMessage.message)),
                        );
                      }
                    }
                  },
                  buttonWidget: state is LoginLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          'Login',
                          style: TextStyles.font20Weight500white,
                        ),
                );
              },
            ),
            Row(
              children: [
                const Expanded(child: Divider(endIndent: 15)),
                Text(
                  'or',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                ),
                const Expanded(child: Divider(indent: 15)),
              ],
            ),
            const SpaceV(20),
            SignWithGoogle(
              text: 'Login ',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
