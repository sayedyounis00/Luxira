import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;
  const BottomNav({
    super.key,
    required this.onItemTapped, required this.selectedIndex,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
        selectedIndex: widget.selectedIndex,
        items: [
          FlashyTabBarItem(
              icon: const Icon(FontAwesomeIcons.house),
              title: const Text('home')),
          FlashyTabBarItem(
              icon: const Icon(FontAwesomeIcons.heart),
              title: const Text('WishList')),
          FlashyTabBarItem(
              icon: const Icon(FontAwesomeIcons.bell),
              title: const Text('Notifiaction')),
          FlashyTabBarItem(
              icon: const Icon(FontAwesomeIcons.user),
              title: const Text('Profile'))
        ],
        onItemSelected: widget.onItemTapped);
  }
}
