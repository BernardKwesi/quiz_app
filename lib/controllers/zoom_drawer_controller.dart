import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth_controller.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void github() {
    _launch("https://www.gdcl.gov.gh");
  }

  void website() {
    print("Hello World");
    _launch("https://www.gdcl.gov.gh");
  }

  void email() {
    final Uri emailLaunchUri =
        Uri(scheme: "mailto:", path: "bernarddormon31@gmail.com");
    _launch(emailLaunchUri.toString());
  }

  void _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
