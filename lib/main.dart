import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/constants/firebase.dart';
import 'package:kasir_app_getx/app/modules/admin/controllers/admin_controller.dart';
import 'package:kasir_app_getx/app/modules/admin/menus/controllers/menus_controller.dart';
import 'package:kasir_app_getx/app/modules/admin/users/controllers/users_controller.dart';
import 'package:kasir_app_getx/app/modules/cashier/cart/controllers/cart_controller.dart';
import 'package:kasir_app_getx/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AuthController());
    Get.put(CashierController());
    Get.put(AdminController());
    Get.put(UsersController());
    Get.put(MenusController());
    Get.put(CartController());
  });
  runApp(
    GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
