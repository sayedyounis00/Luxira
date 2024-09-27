import 'package:flutter/material.dart';
import 'package:luxira/core/widgets/app_list_view_b.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/home/data/model/category.dart';
import 'package:luxira/features/home/data/model/product.dart';
import 'package:luxira/features/home/ui/widgets/app_bar.dart';
import 'package:luxira/features/home/ui/widgets/category_card.dart';
import 'package:luxira/features/home/ui/widgets/custom_search.dart';
import 'package:luxira/features/home/ui/widgets/product_card.dart';
import 'package:luxira/features/home/ui/widgets/slider_item.dart';
import 'package:luxira/features/home/ui/widgets/title_and_see_all.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSearchBar(),
            const SpaceV(20),
            const HomeSlider(),
            TitleAndSeeAll(title: 'Categories', onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: AppListViewbuilder(
                  height: MediaQuery.of(context).size.height * 0.1,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(categorie: categorie[index]);
                  },
                  itemCount: categorie.length),
            ),
            TitleAndSeeAll(title: 'Offers', onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: AppListViewbuilder(
                  height: MediaQuery.of(context).size.height * 0.27,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(productDetails: product[index]);
                  },
                  itemCount: product.length),
            ),
            TitleAndSeeAll(title: 'Recommended', onPressed: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AppListViewbuilder(
                  height: MediaQuery.of(context).size.height * 0.27,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(productDetails: product[index]);
                  },
                  itemCount: product.length),
            ),
            TitleAndSeeAll(title: 'Our Products', onPressed: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AppListViewbuilder(
                  height: MediaQuery.of(context).size.height * 0.27,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(productDetails: product[index]);
                  },
                  itemCount: product.length),
            ),
          ],
        ),
      ),
    );
  }
}
