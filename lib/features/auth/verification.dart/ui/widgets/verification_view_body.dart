import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luxira/core/utils/constants/colors.dart';
import 'package:luxira/core/utils/navigation/routers.dart';
import 'package:luxira/core/widgets/app_alert_dialog.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/auth/verification.dart/logic/cubit/verification_cubit.dart';
import 'package:luxira/features/auth/verification.dart/ui/widgets/input_circule.dart';
import 'package:luxira/features/auth/verification.dart/data/verification_data.dart';

class VerificationViewBody extends StatefulWidget {
  final String email;
  const VerificationViewBody({super.key, required this.email});

  @override
  State<VerificationViewBody> createState() => _VerificationViewBodyState();
}

class _VerificationViewBodyState extends State<VerificationViewBody> {
  bool correct = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            const SpaceV(200),
            Text(
              'Enter the one-Time code sent to This email:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              widget.email,
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
                    BlocProvider.of<VerificationCubit>(context)
                        .resendVerifyCode(widget.email);
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
            BlocListener<VerificationCubit, VerificationState>(
              listener: (context, state) {
                if (state is VerificationSuccess) {
                  Navigator.pushNamed(context, AppRouter.homePage);
                } else if (state is VerificationFailes) {
                  correct = false;
                  showDialog(
                      context: context,
                      builder: (context) => AppAlertDialog(
                          title: 'Some thing went wrong',
                          content: Text(state.errmessage.message)));
                }
              },
              child: AppCustomButton(
                buttonWidget: const Text('Confirm'),
                onTap: () {
                  //! code from verificationdata.textediting controller
                  BlocProvider.of<VerificationCubit>(context)
                      .verifiyRegistration(code: '', email: widget.email);
                  setState(() {});
                },
              ),
            )
          ],
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
