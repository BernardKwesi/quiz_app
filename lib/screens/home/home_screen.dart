import "package:flutter/material.dart";

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question/question_paper_controller.dart';
import 'package:quiz_app/controllers/zoom_drawer_controller.dart';
import 'package:quiz_app/widgets/question_card.dart';

import '../../config/themes/app_colors.dart';
import '../../config/themes/app_icons.dart';
import '../../config/themes/custom_text_style.dart';
import '../../config/themes/ui_parameters.dart';
import '../../widgets/content_area.dart';
import 'menu_screen.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  HomeScreen({Key? key}) : super(key: key);
  final QuestionPaperController _questionPaperController = Get.find();

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(builder: (_) {
      return ZoomDrawer(
        borderRadius: 50,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.DefaultStyle,
        controller: _.zoomDrawerController,
        slideWidth: MediaQuery.of(context).size.width * 0.4,
        menuScreen: MenuScreen(),
        mainScreen: Container(
          decoration: BoxDecoration(
            gradient: mainGradient(),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: controller.toggleDrawer,
                            child: const Icon(AppIcons.menuleft, size: 23)),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              const Icon(AppIcons.peace, size: 20),
                              const SizedBox(width: 10),
                              Text("Hello World",
                                  style: detailText.copyWith(
                                    color: onSurfaceTextColor,
                                  ))
                            ],
                          ),
                        ),
                        Text("What do you want to learn today ?",
                            style: headerText.copyWith(fontSize: 25))
                      ]),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                model:
                                    _questionPaperController.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 20);
                            },
                            itemCount:
                                _questionPaperController.allPapers.length),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      );
    }));
  }
}
