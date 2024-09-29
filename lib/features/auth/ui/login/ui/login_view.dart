import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/features/auth/data/repo/auth_repo_implemtion.dart';
import 'package:luxira/features/auth/ui/login/logic/cubit/login_cubit.dart';
import 'package:luxira/features/auth/ui/login/ui/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImplemtion()),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(child: LoginViewBody()),
        ),
      ),
    );
  }
}
