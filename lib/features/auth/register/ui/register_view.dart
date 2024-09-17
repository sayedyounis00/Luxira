import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luxira/core/helper/validation/form_validation.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/core/utils/style/text_styles.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/custom_text_feild.dart';
import 'package:luxira/core/widgets/drop_down_menu.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/auth/login/ui/widgets/sign_with_google.dart';
import 'package:luxira/features/auth/register/data/new_user.dart';
import 'package:luxira/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:luxira/features/auth/register/ui/widgets/welcome_text.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isVisable = false;
  bool isVisabletwo = false;
  var formKey = GlobalKey<FormState>();
  final TextEditingController firstNamecont = TextEditingController();
  final TextEditingController lastNamecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  final TextEditingController passwordcont = TextEditingController();
  final TextEditingController passwordConfirmcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 400.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0.h),
                    child: const WelcomeText(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFeild(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return FormValidation.validator(
                                errmessage: 'first name required', val: value!);
                          },
                          upText: 'first name',
                          hintText: 'John',
                          controller: firstNamecont,
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                        ),
                      ),
                      const SpaceH(10),
                      Expanded(
                        child: AppTextFeild(
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return FormValidation.validator(
                                errmessage: 'last name requird ', val: value!);
                          },
                          upText: 'last name',
                          hintText: 'wick',
                          controller: lastNamecont,
                          prefixIcon: const Icon(FontAwesomeIcons.user),
                        ),
                      ),
                    ],
                  ),
                  //!need to be fix with a parterner
                  const AppDropDownMenu(),
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
                  const SpaceV(10),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextFeild(
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
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      const SpaceH(10),
                      Expanded(
                        child: AppTextFeild(
                          validator: (value) {
                            return FormValidation.validator(
                                errmessage: 'pls confirm password',
                                val: value!);
                          },
                          obscureText: !isVisabletwo,
                          upText: 'Confirm Password',
                          hintText: '********',
                          controller: passwordConfirmcont,
                          prefixIcon: const Icon(
                            FontAwesomeIcons.lock,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            icon: isVisabletwo
                                ? const Icon(
                                    FontAwesomeIcons.eye,
                                    size: 20,
                                  )
                                : const Icon(
                                    FontAwesomeIcons.eyeLowVision,
                                    size: 20,
                                  ),
                            onPressed: () {
                              isVisabletwo = !isVisabletwo;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SpaceV(10),
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return AppCustomButton(
                        buttonWidget: state is RegisterLoading
                            ? const Center(child: CircularProgressIndicator())
                            :  Text(
                                'Register',
                                style: TextStyles.font20Weight500white,
                              ),
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              passwordcont.text != passwordConfirmcont.text) {
                            handelpasswordMatch();
                          }
                          setState(() {});
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).register(
                              NewUser(
                                email: emailcont.text,
                                password: passwordcont.text,
                                firstname: firstNamecont.text,
                                lastname: lastNamecont.text,
                                gender: 'male',
                              ),
                            );
                            if (state is RegisterSuccess) {
                              Navigator.pushNamed(
                                context,
                                AppRouter.verificationpage,
                                arguments: emailcont.text,
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                      );
                    },
                  ),
                   Row(
                children: [
                  const Expanded(child: Divider(endIndent: 15)),
                  Text(
                    'or login with',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black.withOpacity(.5),
                        ),
                  ),
                  const Expanded(child: Divider(indent: 15)),
                ],
              ),
              const SpaceV(20),
              const SignWithGoogle()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  handelpasswordMatch() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('password are not equal'),
      ),
    );
  }
}


