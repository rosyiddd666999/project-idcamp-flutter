import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/dashboard/detail_items/detail_item.dart';
import 'package:project_id_camp/themes/colors.dart';

import '../../models/product.dart';

class HomeGridView extends StatefulWidget {
  final int itemCount;
  final List<Product> products;

  const HomeGridView({
    super.key,
    required this.itemCount,
    required this.products,
  });

  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > 600 ? 3 : 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        mainAxisExtent:
            size.width > 600 ? size.height * 0.46 : size.height * 0.36,
      ),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        Product product = widget.products[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailItem(
                  product: product,
                ),
              ),
            );
          },
          child: SizedBox(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        product.image,
                        width: double.infinity,
                        height: size.width > 600
                            ? size.height * 0.34
                            : size.height * 0.24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.tertary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 4.0,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            "assets/vectors/shopping_bag_white.svg",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            product.isFavorite = !product.isFavorite;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: product.isFavorite
                              ? SvgPicture.asset(
                                  "assets/vectors/heart_enable.svg")
                              : SvgPicture.asset(
                                  "assets/vectors/heart_disable.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
