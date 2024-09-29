import 'package:flutter/material.dart';
import 'package:luxira/features/home/ui/home_view.dart';
import 'package:luxira/features/home/ui/notification.dart';
import 'package:luxira/features/home/ui/profile.dart';
import 'package:luxira/features/home/ui/widgets/bottom_nav_bar.dart';
import 'package:luxira/features/home/ui/wish_list.dart';

class MianHome extends StatefulWidget {
  const MianHome({super.key});

  @override
  State<MianHome> createState() => _MianHomeState();
}

class _MianHomeState extends State<MianHome> {
  int selectedIndex = 0;
  List<Widget> mainPages = [
    const HomeView(),
    const WishListView(),
    const NotificationView(),
    const ProfileView(),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex,
        onItemTapped: (val) {
          selectedIndex = val;
          setState(() {});
        },
      ),
      body: mainPages[selectedIndex],
    );
  }
}
