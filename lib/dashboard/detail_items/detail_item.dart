import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/dashboard/pages/shopping_cart_page/shopping_cart_page.dart';

import '../../models/product.dart';
import 'detail_description.dart';

class DetailItem extends StatefulWidget {
  const DetailItem({super.key, required this.product});

  final Product product;

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipRRect(
              child: Image.asset(
                widget.product.image,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/vectors/arrow_back.svg",
                          height: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.product.isFavorite =
                                  !widget.product.isFavorite;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: SvgPicture.asset(
                              widget.product.isFavorite
                                  ? "assets/vectors/heart_enable.svg"
                                  : "assets/vectors/heart_disable.svg",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShoppingCartPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: SvgPicture.asset(
                              "assets/vectors/shopping_bag.svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity! < 0) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return DetailDescription(
                          product: widget.product,
                        );
                      },
                    );
                  }
                },
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return DetailDescription(
                        product: widget.product,
                      );
                    },
                  );
                },
                child: SizedBox(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/vectors/swipe_up.svg",
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        MediaQuery.of(context).size.width > 600
                            ? "Tap for details"
                            : "Swipe up for details",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
