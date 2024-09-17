import 'package:flutter/material.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/features/home/data/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;
  const ProductCard({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        shape: const BeveledRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              productDetails.image,
              fit: BoxFit.cover,
            ),
            Text(productDetails.title),
            RichText(
              text: TextSpan(
                  text: r'$' '${productDetails.oldPrice}  ',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: r'$' '${productDetails.newPrice}',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          decoration: TextDecoration.lineThrough),
                    )
                  ]),
            ),
            AppCustomButton(
                height: 40,
                onTap: () {},
                buttonWidget: const Text('Add to cart'))
          ],
        ),
      ),
    );
  }
}
