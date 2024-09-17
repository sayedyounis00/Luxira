import 'package:flutter/material.dart';
import 'package:luxira/core/utils/constants/colors.dart';
import 'package:luxira/core/widgets/space.dart';

class CustomSearchBar extends StatelessWidget {
   const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                autofocus: false,
                onChanged: (searchedChar) {},
                decoration: decorationOfSearchBar(),
              ),
            ),
          ),
          const SpaceH(10),
          Container(
            width: 49,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.kPrimaryColor,
                width: 1.4,
              ),
            ),
            child:   const Icon(Icons.tune, color: AppColors.kPrimaryColor),
          ),
        ],
      ),
    );
  }

  InputDecoration decorationOfSearchBar() {
    return   const InputDecoration(
      prefixIcon: Icon(Icons.search_rounded, color: AppColors.kPrimaryColor),
      hintText: 'Search',
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.all(5),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.4)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.4)),
    );
  }
}