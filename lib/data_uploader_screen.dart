import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase_ref/loading_status.dart';
import './controllers/question/data_uploader.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.loading
                ? "Uploading ..."
                : "UUploading completed")),
      ),
    );
  }
}
