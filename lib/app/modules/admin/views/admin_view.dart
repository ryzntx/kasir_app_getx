import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/modules/admin/views/widgets/item_card.dart';
import 'package:kasir_app_getx/app/modules/admin/views/widgets/item_header.dart';
import 'package:kasir_app_getx/app/modules/auth/controllers/auth_controller.dart';
import 'package:kasir_app_getx/app/routes/app_pages.dart';
import 'package:kasir_app_getx/app/widgets/logout_button.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  //AdminController controller = Get.find();////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminView'),
        centerTitle: true,
        actions: [
          LogoutButton(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemHeaderWidgets(title: 'Data Master'),
            Row(
              children: [
                Expanded(
                  child: ItemCardWidget(
                    icn: Icons.supervisor_account_sharp,
                    title: 'User',
                    function: () {
                      Get.toNamed(Routes.USERS);
                    },
                  ),
                ),
                Expanded(
                  child: ItemCardWidget(
                    icn: Icons.fastfood_rounded,
                    title: 'Menu',
                    function: () {
                      Get.toNamed(Routes.MENUS);
                    },
                  ),
                ),
              ],
            ),
            ItemHeaderWidgets(title: 'Laporan'),
          ],
        ),
      ),
    );
  }
}
