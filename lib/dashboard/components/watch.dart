import 'package:flutter/material.dart';

import '../../models/data_product.dart';
import 'home_gridview.dart';

class WatchView extends StatelessWidget {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProduct = DataProduct();

    final watchProducts = dataProduct.listProduct
        .where((product) => product.name.contains("Watch"))
        .toList();

    return SizedBox(
      child: HomeGridView(
        itemCount: watchProducts.length,
        products: watchProducts,
      ),
    );
  }
}
