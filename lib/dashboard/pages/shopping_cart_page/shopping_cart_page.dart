import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/models/data_product.dart';
import 'package:project_id_camp/models/product.dart';
import 'package:project_id_camp/themes/colors.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  void removeFromCart(Product product, BuildContext context) {
    final shop = context.read<DataProduct>();
    shop.removeFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProduct>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: value.cart.isEmpty
            ? const Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Product product = value.cart[index];
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (product.quantity > 1) {
                                          product.quantity--;
                                          context.read<DataProduct>();
                                        }
                                      },
                                      child: SvgPicture.asset(
                                        "assets/vectors/decrement.svg",
                                        height: 22,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        product.quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        product.quantity++;
                                        context.read<DataProduct>();
                                      },
                                      child: SvgPicture.asset(
                                        "assets/vectors/increment.svg",
                                        height: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => removeFromCart(product, context),
                          child: SvgPicture.asset("assets/vectors/remove.svg"),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
