import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luxira/features/home/ui/home_view.dart';
import 'package:luxira/features/wishlist/ui/wishlist_view.dart';

class AllViews extends StatefulWidget {
  const AllViews({super.key});

  @override
  State<AllViews> createState() => _AllViewsState();
}

class _AllViewsState extends State<AllViews> {
  List<Widget> page = [
    const HomeView(),
    const WishlistView(),
    const WishlistView(),
    const WishlistView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectedIndex],
      bottomNavigationBar: FlashyTabBar(
          selectedIndex: selectedIndex,
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
          onItemSelected: (val) {
            selectedIndex = val;
            setState(() {});
          }),
    );
  }
}
