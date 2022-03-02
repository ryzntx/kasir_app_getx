import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/menus/bindings/menus_binding.dart';
import '../modules/admin/menus/views/menus_view.dart';
import '../modules/admin/users/bindings/users_binding.dart';
import '../modules/admin/users/views/users_view.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/cashier/bindings/cashier_binding.dart';
import '../modules/cashier/cart/bindings/cart_binding.dart';
import '../modules/cashier/cart/views/cart_view.dart';
import '../modules/cashier/views/cashier_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
      children: [
        GetPage(
          name: _Paths.USERS,
          page: () => UsersView(),
          binding: UsersBinding(),
        ),
        GetPage(
          name: _Paths.MENUS,
          page: () => MenusView(),
          binding: MenusBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CASHIER,
      page: () => CashierView(),
      binding: CashierBinding(),
      children: [
        GetPage(
          name: _Paths.CART,
          page: () => CartView(),
          binding: CartBinding(),
        ),
      ],
    ),
  ];
}
