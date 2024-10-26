import 'package:flutter/material.dart';
import 'package:project_id_camp/themes/colors.dart';

import 'about_information_page/about_information_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        90,
                      ),
                      child: Image.asset(
                        "assets/images/boomber_jacket.jpg",
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Abdul Rosyid",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "abdulrosyid@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    List<String> tileTitles = [
                      "About Information",
                      "Logout",
                    ];
                    List<Icon> iconst = const [
                      Icon(
                        Icons.person,
                        size: 26,
                        color: AppColors.primary,
                      ),
                      Icon(
                        Icons.logout,
                        size: 26,
                        color: AppColors.primary,
                      ),
                    ];
                    List<VoidCallback> onTaps = [
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutInformationPage(),
                          ),
                        );
                      },
                      () {
                        Navigator.pop(context);
                      }
                    ];
                    return ListTile(
                      contentPadding: const EdgeInsets.all(
                        15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      tileColor: AppColors.secondary,
                      title: Text(
                        tileTitles[index],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.tertary,
                        maxRadius: 28,
                        child: iconst[index],
                      ),
                      onTap: onTaps[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
