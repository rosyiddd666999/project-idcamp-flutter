import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/data_product.dart';
import '../../models/product.dart';
import '../../themes/colors.dart';
import '../detail_items/detail_item.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final dataProduct = DataProduct();

    final discountProduct = dataProduct.listProduct
        .where((product) => product.name.contains("Boomber Jacket"))
        .toList();

    final Product? product =
        discountProduct.isNotEmpty ? discountProduct.first : null;

    return GestureDetector(
      onTap: () {
        if (product != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailItem(
                product: product,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width > 600 ? 40 : 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width > 600 ? size.width * 0.50 : size.width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shop with us!",
                    style: TextStyle(
                      fontSize: size.width > 600 ? 28 : 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Get 40% Off for all iteams",
                    style: TextStyle(
                      fontSize: size.width > 600 ? 40 : 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Shop now",
                        style: TextStyle(
                          fontSize: size.width > 600 ? 24 : 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/vectors/arrow_right.svg",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/imagemaincontainer.png",
              width: size.width > 600 ? size.width * 0.26 : size.width * 0.36,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
