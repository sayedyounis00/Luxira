import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/features/auth/ui/login/ui/login_view.dart';
import 'package:luxira/features/auth/ui/register/ui/register_view.dart';
import 'package:luxira/features/auth/ui/reset%20password/ui/forget_password.dart';
import 'package:luxira/features/auth/ui/reset%20password/ui/reset_done.dart';
import 'package:luxira/features/auth/ui/reset%20password/ui/reset_password.dart';
import 'package:luxira/features/auth/ui/verification.dart/ui/verification_view.dart';
import 'package:luxira/features/home/ui/home_view.dart';
import 'package:luxira/features/home/ui/mian_home.dart';

Route<dynamic> onGenerate(RouteSettings setting) {
  switch (setting.name) {
    case AppRouter.loginPage:
      {
        return CupertinoPageRoute(builder: (_) => const LoginView());
      }
    case AppRouter.registerPage:
      {
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      }
    case AppRouter.forgetPassword:
      {
        return CupertinoPageRoute(builder: (_) => const ForgetPasswordView());
      }
    case AppRouter.resetPassword:
      {
        return CupertinoPageRoute(builder: (_) => const ResetPassword());
      }
    case AppRouter.resetDone:
      {
        return CupertinoPageRoute(builder: (_) => const ResetDone());
      }
    case AppRouter.verification:
      {
        return CupertinoPageRoute(builder: (_) => const VerificationView(email: '',));
      }
    case AppRouter.homePage:
      {
        return CupertinoPageRoute(builder: (_) => const HomeView());
      }
    case AppRouter.mainHome:
      {
        return CupertinoPageRoute(builder: (_) => const MianHome());
      }

    default:
      {
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('this page not found'),
                  ),
                ));
      }
  }
}
