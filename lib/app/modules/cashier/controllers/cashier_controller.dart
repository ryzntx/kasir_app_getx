import 'package:get/get.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';

import '../../../constants/firebase.dart';

class CashierController extends GetxController {
  //TODO: Implement CashierController

  static CashierController instance = Get.put(CashierController());
  RxList<Menu> menus = RxList<Menu>([]);
  String collection = 'menu';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    menus.bindStream(getAllMenu());
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Stream<List<Menu>> getAllMenu() {
    return firebaseFirestore.collection(collection).snapshots().map((query) =>
        query.docs.map((item) => Menu.fromMap(item.data())).toList());
  }
}
