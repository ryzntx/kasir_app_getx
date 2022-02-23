import 'package:get/get.dart';

class AdminController extends GetxController {
  //TODO: Implement AdminController
  static AdminController instance = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
