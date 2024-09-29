import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luxira/core/utils/constants/colors.dart';

class InputCircule extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool correct;
  final Type textControler;
  const InputCircule({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.textControler, required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      alignment: Alignment.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color:correct? AppColors.kPrimaryColor:Colors.red)),
      child: TextField(
        onChanged: (val) {
          if (val.isNotEmpty && isLast == false) {
            FocusScope.of(context).nextFocus();
          } else if (val.isNotEmpty && isFirst == false) {
            FocusScope.of(context).nextFocus();
          } else if (val.isEmpty && isFirst == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: const TextStyle(color: AppColors.kPrimaryColor, fontSize: 20),
        cursorWidth: 0,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
