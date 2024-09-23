import 'package:flutter/material.dart';
import 'package:luxira/core/widgets/space.dart';

class SignWithGoogle extends StatelessWidget {
  final Function() onTap;
  final String text;
  const SignWithGoogle({
    super.key,
    required this.onTap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Google.png',
              width: 30,
            ),
            const SpaceH(15),
            Text(
              '$text with Google',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.5,
                    color: const Color(0xff7C838A),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
