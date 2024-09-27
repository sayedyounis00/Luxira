import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxira/core/utils/constants/colors.dart';
import 'package:luxira/core/widgets/app_custom_button.dart';
import 'package:luxira/core/widgets/space.dart';
import 'package:luxira/features/home/data/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;
  const ProductCard({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shadowColor: const Color.fromARGB(75, 158, 158, 158),
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Image.asset(
                      productDetails.image,
                      height: MediaQuery.of(context).size.width * 0.288,
                    ),
                  ),
                  IconButton.filled(
                    color: AppColors.kPrimaryColor,
                    padding: const EdgeInsets.all(6),
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    )),
                    constraints: const BoxConstraints(
                      maxWidth: 27,
                      maxHeight: 27,
                    ),
                    iconSize: 16,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ],
              ),
              const SpaceV(10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  productDetails.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
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
              ),
              AppCustomButton(
                height: 70.sp,
                onTap: () {},
                buttonWidget: const Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
