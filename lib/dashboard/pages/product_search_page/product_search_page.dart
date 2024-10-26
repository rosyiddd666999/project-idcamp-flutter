import 'package:flutter/material.dart';
import 'package:project_id_camp/models/data_product.dart';
import 'package:project_id_camp/themes/colors.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../detail_items/detail_item.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  List<Product> searchResults = [];

  @override
  void initState() {
    super.initState();
    final List<Product> dataProduct =
        Provider.of<DataProduct>(context, listen: false).listProduct;
    searchResults = dataProduct;
  }

  void searchProducts(String query) {
    final List<Product> dataProduct =
        Provider.of<DataProduct>(context, listen: false).listProduct;

    final results = dataProduct
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      searchResults = results.isEmpty && query.isEmpty ? dataProduct : results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: searchProducts,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search here...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final product = searchResults[index];
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
                      child: Container(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  product.price,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
