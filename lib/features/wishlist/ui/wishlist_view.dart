import 'package:flutter/material.dart';
import 'package:luxira/features/home/data/model/product.dart';
import 'package:luxira/features/home/ui/widgets/product_card.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          const Text(
            'Wishlist',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: GridView.builder(
                padding: EdgeInsets.zero,
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
