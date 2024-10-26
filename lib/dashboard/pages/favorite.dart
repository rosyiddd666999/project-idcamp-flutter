import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/dashboard/components/home_gridview.dart';
import 'package:project_id_camp/models/product.dart';
import 'package:provider/provider.dart';
import '../../models/data_product.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> dataProduct =
        Provider.of<DataProduct>(context).listProduct;

    final favoriteProducts =
        dataProduct.where((product) => product.isFavorite).toList();

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Favorite",
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/vectors/heart_enable.svg",
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HomeGridView(
                  itemCount: favoriteProducts.length,
                  products: favoriteProducts),
            ],
          ),
        ),
      )),
    );
  }
}
