import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../firebase_ref/references.dart';
import '../../models/question.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ['biology', 'chemistry', 'math', 'physics'];
    print("============== Hom ===================");
    /*  try { */
    QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
    final paperList =
        data.docs.map((paper) => QuestionModel.fromSnapShot(paper)).toList();
    allPapers.assignAll(paperList);

    for (var paper in paperList) {
      for (var imgname in imgName) {
        if (imgname.toLowerCase() == paper.title.toLowerCase()) {
          final imgUrl =
              await Get.find<FirebaseStorageService>().getImage(imgname);
          paper.imageUrl = imgUrl;
        }
      }
      /*   final imgUrl =
          await Get.find<FirebaseStorageService>().getImage(paper.title);
      paper.imageUrl = imgUrl; */
    }
    print("================Hello World================");
    print(paperList);
    allPapers.assignAll(paperList);
    /*    } catch (e) {
      print(e);
    } */
  }
}
