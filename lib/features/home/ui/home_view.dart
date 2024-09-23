import 'package:flutter/material.dart';
import 'package:luxira/core/widgets/app_list_view_b.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/home/data/model/category.dart';
import 'package:luxira/features/home/data/model/product.dart';
import 'package:luxira/features/home/ui/widgets/app_bar.dart';
import 'package:luxira/features/home/ui/widgets/bottom_nav_bar.dart';
import 'package:luxira/features/home/ui/widgets/category_card.dart';
import 'package:luxira/features/home/ui/widgets/custom_search.dart';
import 'package:luxira/features/home/ui/widgets/product_card.dart';
import 'package:luxira/features/home/ui/widgets/slider_item.dart';
import 'package:luxira/features/home/ui/widgets/title_and_see_all.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(),
            const SpaceV(30),
            const HomeSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TitleAndSeeAll(title: 'Categories', onPressed: () {}),
            ),
            AppListViewbuilder(
                height: MediaQuery.of(context).size.height * 0.1,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCard(categorie: categorie[index]);
                },
                itemCount: categorie.length),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TitleAndSeeAll(title: 'Offers', onPressed: () {}),
            ),
            AppListViewbuilder(
                height: MediaQuery.of(context).size.height * 0.25,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(productDetails: product[index]);
                },
                itemCount: product.length),
          ],
        ),
      ),
    ));
  }
}
