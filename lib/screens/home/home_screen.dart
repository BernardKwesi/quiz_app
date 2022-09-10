import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question/question_paper_controller.dart';
import 'package:quiz_app/widgets/question_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  QuestionPaperController _questionPaperController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                model: _questionPaperController.allPapers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length),
      ),
    );
  }
}
