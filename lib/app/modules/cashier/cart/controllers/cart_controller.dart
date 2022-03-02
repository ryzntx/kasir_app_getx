import 'package:get/get.dart';

import '../../../../constants/firebase.dart';
import '../../../../data/models/carts_model.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  static CartController instance = Get.find();

  RxList<CartsModel> carts = RxList<CartsModel>([]);
  String collectionCart = 'cart';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //carts.bindStream(getAllCarts());
  }

  @override
  void onReady() {
    super.onReady();
    carts.bindStream(getAllCarts());
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Stream<List<CartsModel>> getAllCarts() =>
      firebaseFirestore.collection(collectionCart).snapshots().map((query) =>
          query.docs.map((item) => CartsModel.fromSnapshot(item)).toList());
}
