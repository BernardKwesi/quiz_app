import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:quiz_app/config/themes/ui_parameters.dart';
import '../config/themes/app_icons.dart';
import '../config/themes/custom_text_style.dart';
import '../controllers/question/question_paper_controller.dart';
import '../models/question.dart';
import 'icon_and_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({Key? key, required this.model}) : super(key: key);
  final QuestionModel model;
  @override
  Widget build(BuildContext context) {
    const double _padding = 20;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        onTap: () {
          controller.navigateToQuestions(paper: model);
        },
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cartTiles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            model.description,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                size: 20,
                              ),
                              text: Text(
                                "${model.questionCount.toString()} quizzes",
                                style: detailText.copyWith(
                                  color: UIParameters.isDarkMode()
                                      ? Colors.white
                                      : Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            AppIconText(
                              icon: Icon(
                                Icons.timer,
                                size: 20,
                                color: UIParameters.isDarkMode()
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                              ),
                              text: Text(
                                  "${Duration(seconds: model.timeSeconds).inMinutes.toString()} minutes",
                                  style: detailText.copyWith(
                                    color: UIParameters.isDarkMode()
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: -_padding,
                right: -_padding,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cardBorderRadius),
                        bottomRight: Radius.circular(cardBorderRadius),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      AppIcons.trophyOutLine,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
