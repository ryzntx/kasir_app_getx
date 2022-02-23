import 'package:kasir_app_getx/app/modules/admin/controllers/admin_controller.dart';
import 'package:kasir_app_getx/app/modules/admin/menus/controllers/menus_controller.dart';
import 'package:kasir_app_getx/app/modules/admin/users/controllers/users_controller.dart';
import 'package:kasir_app_getx/app/modules/auth/controllers/auth_controller.dart';
import 'package:kasir_app_getx/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:kasir_app_getx/app/modules/home/controllers/home_controller.dart';

HomeController homeController = HomeController.instance;
AuthController authController = AuthController.instance;
AdminController adminController = AdminController.instance;
CashierController cashierController = CashierController.instance;
UsersController usersController = UsersController.instance;
MenusController menusController = MenusController.instance;
