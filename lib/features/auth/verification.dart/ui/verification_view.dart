import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/core/utils/constants/colors.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:luxira/features/auth/verification.dart/data/verificaton_repo.dart';
import 'package:luxira/features/auth/verification.dart/ui/widgets/input_circule.dart';
import 'package:luxira/features/auth/verification.dart/data/verification_data.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  bool correct = true;
  late String userEmail = 'init email';
  @override
  void initState() {
    userEmail = BlocProvider.of<RegisterCubit>(context).user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OTP Verification',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpaceV(200),
              Text(
                'Enter the one-Time code sent to the This email:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                userEmail,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: enterCode(6),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Did\'t you recieve the code ?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      VerificatonRepo().resendVerifyCode(userEmail);
                    },
                    child: Text(
                      'Resend code',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kPrimaryColor),
                    ),
                  ),
                ],
              ),
              AppCustomButton(
                buttonWidget: const Text('Confirm'),
                onTap: () {
                  correct = false;
                  VerificatonRepo()
                  //! code from verificationdata.textediting controller
                      .verifiyRegistration(code:'', email: userEmail);
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> enterCode(int count) {
    return List.generate(
        count,
        (i) => InputCircule(
              correct: correct,
              isFirst: VerificationData.isFirst[i],
              isLast: VerificationData.isLast[i],
              textControler: VerificationData.textControler[i],
            )).toList();
  }
}
