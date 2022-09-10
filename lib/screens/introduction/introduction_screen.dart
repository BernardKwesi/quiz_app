import 'package:flutter/material.dart';
import 'package:quiz_app/services/firebase_storage_service.dart';
import 'package:quiz_app/widgets/app_circle.dart';
import 'package:get/get.dart';
import '../../config/themes/app_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: mainGradient(context),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.star,
              size: 50,
            ),
            const SizedBox(height: 40),
            const Text(
              "This is a study app. You can use it as you want. If you understand how it works, you would be able to scale it.",
              style: TextStyle(
                fontSize: 23,
                color: onSurfaceTextColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppCircleButton(
              onTap: () {
                Get.offAllNamed("/home");
              },
              child: const Icon(Icons.arrow_forward, size: 35),
            ),
          ])),
    );
  }
}
