import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/constants/colors.dart';

class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({
    super.key,
  });

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  List<String> types = ['male', 'female'];
   String dropdownVal='male';
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
            value: dropdownVal,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownVal = value!;
              });
            },
            items: types.map<DropdownMenuItem<String>>((String value) {
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
