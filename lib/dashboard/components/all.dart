import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/data_product.dart';
import 'home_gridview.dart';

class AllView extends StatelessWidget {
  const AllView({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<DataProduct>(context, listen: false);
    final allProduct = shop.listProduct;

    return SizedBox(
      child: HomeGridView(
        itemCount: allProduct.length,
        products: allProduct,
      ),
    );
  }
}
