import 'package:flutter/material.dart';
import 'package:luxira/core/utils/constants/colors.dart';

AppBar customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Image.asset('assets/images/logo.png', width: 74, height: 34),
    actions:  [
      IconButton(
        icon: const Icon(Icons.notifications_none,
            color: AppColors.kPrimaryColor, size: 26),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined), color: AppColors.kPrimaryColor,
        onPressed: () {},
      ),
    ],
  );
}
