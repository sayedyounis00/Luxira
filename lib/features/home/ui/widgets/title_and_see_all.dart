import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const TitleAndSeeAll({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.start,
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              textAlign: TextAlign.start,
              'See All',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff0088C9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
