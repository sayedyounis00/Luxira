import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/features/home/data/model/category.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categorie;
  const CategoryCard({super.key, required this.categorie});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.22,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(categorie.image)),
            Text(
              categorie.title,
              style:
                  TextStyle(fontSize: 34.sp, color: Colors.black.withOpacity(.6)),
            ),
          ],
        )),
      ),
    );
  }
}
