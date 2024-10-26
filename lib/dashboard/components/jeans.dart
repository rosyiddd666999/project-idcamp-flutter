import 'package:flutter/material.dart';

import '../../models/data_product.dart';
import 'home_gridview.dart';

class JeansView extends StatelessWidget {
  const JeansView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProduct = DataProduct();

    final jeansProducts = dataProduct.listProduct
        .where((product) => product.name.contains("Jeans"))
        .toList();

    return SizedBox(
      child: HomeGridView(
        itemCount: jeansProducts.length,
        products: jeansProducts,
      ),
    );
  }
}
