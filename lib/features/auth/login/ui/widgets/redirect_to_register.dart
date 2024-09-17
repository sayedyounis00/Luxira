
import 'package:flutter/material.dart';
import 'package:luxira/core/utils/constants/colors.dart';
import 'package:luxira/core/widgets/space.dart';

class RedirectToRegister extends StatelessWidget {
  const RedirectToRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'New here?',
          //!change with style
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black.withOpacity(.5),
              fontWeight: FontWeight.w500),
        ),
        const SpaceH(5),
        InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const RegisterView(),
            //   ),
            // );
          },
          child: Text(
            'Create an account.',
            //!change with style
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
