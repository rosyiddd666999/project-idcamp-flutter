import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/dashboard/components/all.dart';
import 'package:project_id_camp/dashboard/components/jacket.dart';
import 'package:project_id_camp/dashboard/components/jeans.dart';
import 'package:project_id_camp/dashboard/components/shoes.dart';
import 'package:project_id_camp/dashboard/components/watch.dart';
import 'package:project_id_camp/dashboard/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:project_id_camp/themes/colors.dart';

import '../components/main_container.dart';
import 'product_search_page/product_search_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentTab;

  @override
  void initState() {
    super.initState();
    currentTab = 0;
  }

  static const List<String> listItem = [
    "All",
    "Jacket",
    "Jeans",
    "Shoes",
    "Watch",
  ];

  static const List<Widget> contentView = [
    AllView(),
    JacketView(),
    JeansView(),
    ShoesView(),
    WatchView(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Falcon Thought",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
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
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                          color: Colors.white,
                        ),
                        child:
                            SvgPicture.asset("assets/vectors/shopping_bag.svg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductSearchPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(
                        40,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/vectors/search.svg",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("What are you looking for...")
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MainContainer(
                  size: size,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 38,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                    itemCount: listItem.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentTab = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          height: 38,
                          decoration: BoxDecoration(
                            color: currentTab == index
                                ? Colors.white
                                : AppColors.secondary,
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              listItem[index],
                              style: TextStyle(
                                color: currentTab == index
                                    ? Colors.black
                                    : Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                contentView[currentTab],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
