import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screens/login/login_screen.dart';

import '../firebase_ref/references.dart';
import '../screens/home/home_screen.dart';
import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();

  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) => {_user.value = user});
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      print("signing in with google ...............");
      if (account != null) {
        final _authAccount = await account.authentication;

        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credential);

        await saveUser(account);
        navigateToHome();
      }
    } on Exception catch (e) {
      print(e);
      return;
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        //Naviagate to Login page
        navigateToLogin();
      }),
      barrierDismissible: false,
    );
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToLogin() {
    Get.toNamed(LoginScreen.routeName);
  }

  void navigateToHome() {
    Get.toNamed(HomeScreen.routeName);
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> signOut() async {
    print("====================");
    print("Signing Out ....");
    try {
      await _auth.signOut();
      Get.offNamed(HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
