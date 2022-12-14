import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:quiz_app/config/themes/app_colors.dart';

import '../../controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(children: [
            Positioned(
              top: 50,
              right: MediaQuery.of(context).size.width * 0.3,
              child: InkWell(
                onTap: controller.toggleDrawer,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Obx(() => controller.user.value == null
                    ? SizedBox()
                    : Text(controller.user.value!.displayName ?? '')),
                const Spacer(flex: 1),
                _DrawerButton(
                  icon: Icons.web,
                  label: "Website",
                  onPressed: controller.website,
                ),
                _DrawerButton(
                  icon: Icons.email,
                  label: "Email",
                  onPressed: controller.email,
                ),
                _DrawerButton(
                  icon: Icons.web,
                  label: "Github",
                  onPressed: controller.github,
                ),
                const Spacer(
                  flex: 4,
                ),
                _DrawerButton(
                  icon: Icons.logout,
                  label: "Logout",
                  onPressed: controller.signOut,
                ),
                const Spacer(flex: 2),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label,
            style: TextStyle(
              fontSize: 20,
            )));
  }
}
