import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/intro_1.dart';
import '../components/intro_2.dart';
import '../../dashboard/components/my_dashboard.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [
              Intro1(),
              Intro2(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.16,
              decoration: const BoxDecoration(
                color: AppColors.quartenary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 30,
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 2,
                        effect: const WormEffect(
                          dotWidth: 7,
                          dotHeight: 7,
                          activeDotColor: AppColors.primary,
                          paintStyle: PaintingStyle.stroke,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onLastPage
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyDashboard(),
                                  ),
                                )
                              : _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                        },
                        child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.39,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset("assets/vectors/arrow_right.svg")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
