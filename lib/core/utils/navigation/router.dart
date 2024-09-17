import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/features/auth/login/ui/login_view.dart';
import 'package:luxira/features/auth/register/ui/register_view.dart';
import 'package:luxira/features/auth/verification.dart/ui/verification_view.dart';
import 'package:luxira/features/home/ui/home_view.dart';

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
    case AppRouter.verificationpage:
      {
        return CupertinoPageRoute(builder: (_) => const VerificationView());
      }
    case AppRouter.homePage:
      {
        return CupertinoPageRoute(builder: (_) => const HomeView());
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
