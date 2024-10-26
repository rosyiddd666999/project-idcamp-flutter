import 'package:flutter/material.dart';

class AboutInformationPage extends StatelessWidget {
  const AboutInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Information",
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          "My names Abdul Rosyid, i am student colage and flutter devloper.",
        ),
      ),
    );
  }
}
