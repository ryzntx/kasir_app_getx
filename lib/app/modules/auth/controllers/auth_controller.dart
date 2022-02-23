import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kasir_app_getx/app/modules/admin/views/admin_view.dart';

import 'package:kasir_app_getx/app/modules/auth/views/auth_view.dart';
import 'package:kasir_app_getx/app/modules/cashier/views/cashier_view.dart';

import '../../../constants/firebase.dart';
import '../../../data/models/users_model.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  late Rx<FirebaseFirestore> firestore;

  final count = 0.obs;
  FocusNode focusNode = FocusNode();
  RxBool passwordVisible = true.obs;
  RxBool isLoading = false.obs;
  RxBool isLoginWidgetDisplayed = true.obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String usersCollection = "users";
  Rx<Users> userModel = Users().obs;

  changeDIsplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  isLoadings() {
    isLoading.value = !isLoading.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      QuerySnapshot data = await firebaseFirestore
          .collection(usersCollection)
          .where("uid", isEqualTo: user.uid)
          .get();
      if (data.docs.first.get('role') == 'admin') {
        Get.offAll(() => AdminView());
      } else {
        Get.offAll(() => CashierView());
      }
      // user is logged in

    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => AuthView());
    }
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void togglePasswordVisibility() =>
      passwordVisible.value = !passwordVisible.value;

  void register() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
        _clearControllers();
        changeDIsplayedAuthWidget();
      });
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar("Error", e.message!,
          margin: EdgeInsets.all(15),
          snackPosition: SnackPosition.BOTTOM,
          overlayBlur: 0,
          barBlur: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255));
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  void login() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((result) {
        String _userId = result.user!.uid;
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      Get.snackbar("Error", e.message!,
          margin: EdgeInsets.all(15),
          snackPosition: SnackPosition.BOTTOM,
          overlayBlur: 0,
          barBlur: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255));
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "uid": userId,
      "email": email.text.trim(),
      "role": "admin"
    });
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => Users.fromSnapshot(doc));
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
