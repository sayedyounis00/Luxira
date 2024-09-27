import 'package:flutter/material.dart';
import 'package:luxira/features/home/data/model/product.dart';
import 'package:luxira/features/home/ui/widgets/product_card.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
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
