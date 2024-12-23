import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Stack(
        children: [
          Image.asset(
            size.width > 500
                ? "assets/images/intro_dekstop_2.jpg"
                : "assets/images/intro_2.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: size.height * 0.20,
            right: 0,
            left: 0,
            child: const SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Text(
                      "Level up your lifestyle",
                      style: TextStyle(
                        fontFamily: 'ZenDots',
                        fontSize: 32,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "There are many clothes with designs that are suitable for you today",
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
