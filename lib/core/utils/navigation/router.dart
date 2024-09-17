import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/features/auth/login/ui/login_view.dart';

Route<dynamic> onGenerate(RouteSettings setting) {
  switch (setting.name) {
    case AppRouter.loginPage:
      {
        return CupertinoPageRoute(builder: (_) => const LoginView());
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
