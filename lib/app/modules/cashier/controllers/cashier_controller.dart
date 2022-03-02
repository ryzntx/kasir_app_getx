import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasir_app_getx/app/data/models/carts_model.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';
import 'package:kasir_app_getx/app/widgets/custom_snakbar.dart';

import '../../../constants/firebase.dart';

class CashierController extends GetxController {
  //TODO: Implement CashierController

  static CashierController instance = Get.put(CashierController());
  RxList<Menu> menus = RxList<Menu>([]);
  RxList<CartsModel> carts = RxList<CartsModel>([]);
  String collection = 'menu';
  String collectionCart = 'cart';

  //Rx<CartsModel> cartModel = CartsModel().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    menus.bindStream(getAllMenu());
    carts.bindStream(getAllCarts());
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void decrement() => count.value--;

  Future<void> addToCart(Menu menu) async {
    int qty = count.value;
    int price = int.parse(menu.price!);

    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection(collectionCart).get();

    try {
      if (querySnapshot.docs.isEmpty) {
        await firebaseFirestore.collection(collectionCart).add({
          'menuId': menu.id,
          'name': menu.name,
          'price': menu.price,
          'cost': price * count.value,
          'quantity': qty,
        });
      } else if (querySnapshot.docs.isNotEmpty) {
        var id = menu.id;
        QuerySnapshot data = await firebaseFirestore
            .collection(collectionCart)
            .where("menuId", isEqualTo: id)
            .get();
        if (data.docs.length == 1) {
          //print(data.docs.first.id);
          await firebaseFirestore
              .collection(collectionCart)
              .doc(data.docs.first.id)
              .update({
            'quantity': qty,
            'cost': price * count.value,
          });
          CustomSnackBar.showSnackBar(
            context: Get.context,
            title: 'Success',
            message: 'Quantity updated',
            backgroundColor: Colors.white,
            position: SnackPosition.TOP,
          );
        } else if (data.docs.length == 0) {
          await firebaseFirestore.collection(collectionCart).add({
            'menuId': menu.id,
            'name': menu.name,
            'price': menu.price,
            'cost': price * count.value,
            'quantity': qty,
          });
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }

    count.value = 0;
  }

  Stream<List<Menu>> getAllMenu() {
    return firebaseFirestore.collection(collection).snapshots().map(
        (query) => query.docs.map((item) => Menu.fromSnapshot(item)).toList());
  }

  Stream<List<CartsModel>> getAllCarts() {
    return firebaseFirestore.collection('cart').snapshots().map((query) =>
        query.docs.map((item) => CartsModel.fromSnapshot(item)).toList());
  }
}
