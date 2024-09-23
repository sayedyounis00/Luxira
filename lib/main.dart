import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/navigation/router.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/features/auth/register/logic/cubit/register_cubit.dart';

void main() {
  runApp(const Luxira());
}

class Luxira extends StatelessWidget {
  const Luxira({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(990.63, 2147.69),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          initialRoute: AppRouter.loginPage,
        ),
      ),
    );
  }
@override
Widget build(BuildContext context) {
  return  ScreenUtilInit(
    designSize: const Size(990.63, 2147.69),
    minTextAdapt: true,
    child: BlocProvider(
      create: (context) => RegisterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRouter.loginPage,
      ),
    ),
  );
}
}
