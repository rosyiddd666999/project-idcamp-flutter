import 'package:flutter/material.dart';

import '../../models/data_product.dart';
import 'home_gridview.dart';

class ShoesView extends StatelessWidget {
  const ShoesView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProduct = DataProduct();

    final shoesProducts = dataProduct.listProduct
        .where((product) =>
            product.name.contains("Shoes") || product.name.contains("Sneakers"))
        .toList();

    return SizedBox(
      child: HomeGridView(
        itemCount: shoesProducts.length,
        products: shoesProducts,
      ),
    );
  }
}
