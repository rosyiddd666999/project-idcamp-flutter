import 'package:flutter/material.dart';

import '../../models/data_product.dart';
import 'home_gridview.dart';

class JacketView extends StatelessWidget {
  const JacketView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProduct = DataProduct();

    final jacketProducts = dataProduct.listProduct
        .where((product) => product.name.contains("Jacket"))
        .toList();

    return SizedBox(
      child: HomeGridView(
        itemCount: jacketProducts.length,
        products: jacketProducts,
      ),
    );
  }
}
