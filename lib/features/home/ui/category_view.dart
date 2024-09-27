import 'package:flutter/material.dart';
import 'package:luxira/features/home/data/model/product.dart';
import 'package:luxira/features/home/ui/widgets/custom_search.dart';
import 'package:luxira/features/home/ui/widgets/product_card.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Clothes',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 2.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(productDetails: product[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
