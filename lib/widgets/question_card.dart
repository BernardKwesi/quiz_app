import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import '../models/question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.model}) : super(key: key);
  final QuestionModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRect(
            child: ColoredBox(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              child: SizedBox(
                height: 200,
                width: 200,
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
          )
        ],
      ),
    );
  }
}
