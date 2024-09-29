import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/constants/colors.dart';

class AppDropDownMenu extends StatefulWidget {
  final List<String> types;
  final String dropdownVal;
  final Function(String?) onChange;
  const AppDropDownMenu({
    super.key, required this.types, required this.dropdownVal, required this.onChange,
  });

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          margin: EdgeInsets.symmetric(vertical: 16.h),
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text('Gender'),
            value: widget.dropdownVal,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            onChanged: widget.onChange,
            items: widget.types.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
