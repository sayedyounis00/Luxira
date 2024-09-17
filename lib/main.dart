import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/navigation/router.dart';
import 'package:luxira/core/utils/navigation/routers.dart';

void main() {
  runApp(const Luxira());
}

class Luxira extends StatelessWidget {
  const Luxira({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(990.63, 2147.69),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRouter.loginPage,
      ),
    );
  }
}
