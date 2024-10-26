import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/models/data_product.dart';
import 'package:project_id_camp/models/product.dart';
import 'package:project_id_camp/themes/colors.dart';
import 'package:provider/provider.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({super.key, required this.product});

  final Product product;

  @override
  DetailDescriptionState createState() => DetailDescriptionState();
}

class DetailDescriptionState extends State<DetailDescription> {
  int productQuantity = 0;

  void decrementQuantity() {
    if (productQuantity > 1) {
      setState(() {
        productQuantity--;
      });
    }
  }

  void incrementQuantity() {
    setState(() {
      productQuantity++;
    });
  }

  void addToCart(BuildContext context) {
    final shop = Provider.of<DataProduct>(context, listen: false);
    shop.addToCart(widget.product, productQuantity);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Product added to cart successfully!"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/vectors/arrow_down.svg",
                          width: 16,
                        ),
                      ),
                      Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    widget.product.description ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: AppColors.secondary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${widget.product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: decrementQuantity,
                              child: SvgPicture.asset(
                                "assets/vectors/decrement.svg",
                                height: 30,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(
                                  productQuantity.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: incrementQuantity,
                              child: SvgPicture.asset(
                                "assets/vectors/increment.svg",
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => addToCart(context),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.tertary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Add to Shopping Bag",
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
