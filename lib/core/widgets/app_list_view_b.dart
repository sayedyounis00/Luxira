import 'package:flutter/material.dart';

class AppListViewbuilder extends StatelessWidget {
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double height;
  const AppListViewbuilder({
    super.key,
    required this.itemBuilder,
    required this.itemCount, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
