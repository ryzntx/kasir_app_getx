import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasir_app_getx/app/data/models/users_model.dart';

import '../../../../constants/firebase.dart';

class UsersController extends GetxController {
  //TODO: Implement UsersController

  static UsersController instance = Get.find();

  late CollectionReference collectionReference;
  final data = FirebaseFirestore.instance;

  RxList<Users> users = RxList<Users>([]);
  bool isActive = false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("users");
    users.bindStream(getAllUsers());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Stream<List<Users>> getAllUsers() {
    return collectionReference
        .snapshots()
        .map((event) => event.docs.map((item) => Users.fromMap(item)).toList());
  }
}
