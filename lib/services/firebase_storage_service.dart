import 'package:get/get.dart';

import '../firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }

    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl =
          "https://firebasestorage.googleapis.com/v0/b/quizapp-81f9e.appspot.com/o/question_paper_images%2F$imgName.png?alt=media&token=d4b47376-a21f-48eb-b798-ccbdac5bd26b";
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
