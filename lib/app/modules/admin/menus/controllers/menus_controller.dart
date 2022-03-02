import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasir_app_getx/app/constants/firebase.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';
import 'package:path/path.dart';

import '../../../../widgets/custom_full_screen_dialog.dart';
import '../../../../widgets/custom_snakbar.dart';

class MenusController extends GetxController {
  //TODO: Implement MenusController

  static MenusController instance = Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameMenu = TextEditingController();
  final TextEditingController priceMenu = TextEditingController();

  late CollectionReference reference;

  final picker = ImagePicker();
  late File image;

  RxString url = ''.obs;

  var selectedImagePath = ''.obs;

  RxList<Menu> menu = RxList<Menu>([]);

  final count = 0.obs;

  @override
  void onInit() {
    reference = firebaseFirestore.collection('menu');

    menu.bindStream(getAllMenu());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      print(selectedImagePath.value);
    } else {
      CustomSnackBar.showSnackBar(
          position: SnackPosition.BOTTOM,
          context: Get.context,
          title: 'Error',
          message: 'No Image Selected',
          backgroundColor: Colors.red);
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return "Price can not be empty";
    }
    return null;
  }

  Future<void> saveUpdateMenu(
      String name, String price, String docId, int addEditFlag) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      // melakukan fungsi
      String fileName = basename(File(selectedImagePath.value).path);
      String url;
      Reference ref = storage.ref().child("/menu/$fileName");
      UploadTask uploadTask = ref.putFile(File(selectedImagePath.value));
      CustomFullScreenDialog.showDialog();
      var dowurl =
          await (await uploadTask).ref.getDownloadURL().catchError((e) {
        CustomSnackBar.showSnackBar(
            position: SnackPosition.BOTTOM,
            context: Get.context,
            title: 'Error',
            message: e.toString(),
            backgroundColor: Colors.red);
      });

      url = dowurl.toString();

      //CustomFullScreenDialog.showDialog();
      reference
          .add({'name': name, 'price': price, 'photo': url}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            position: SnackPosition.BOTTOM,
            context: Get.context,
            title: "Menu Added",
            message: "New menu added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            position: SnackPosition.BOTTOM,
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
      selectedImagePath.value = '';
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      reference
          .doc(docId)
          .update({'name': name, 'price': price}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            position: SnackPosition.BOTTOM,
            context: Get.context,
            title: "Menu Updated",
            message: "Menu updated successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            position: SnackPosition.BOTTOM,
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    reference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          position: SnackPosition.BOTTOM,
          context: Get.context,
          title: "Menu Deleted",
          message: "Menu deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          position: SnackPosition.BOTTOM,
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }

  void clearEditingControllers() {
    nameMenu.clear();
    priceMenu.clear();
  }

  Stream<List<Menu>> getAllMenu() => reference.snapshots().map(
      (query) => query.docs.map((item) => Menu.fromSnapshot(item)).toList());
}
