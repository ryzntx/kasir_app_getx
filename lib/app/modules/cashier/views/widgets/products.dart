import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasir_app_getx/app/constants/controllers.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';
import 'package:kasir_app_getx/app/modules/cashier/views/widgets/product_item.dart';

class MenuListWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4,
        crossAxisSpacing: 10,
        children: cashierController.menus.map((Menu menu) {
          return MenuItemWidgets(menu: menu);
        }).toList(),
      ),
    );
  }
}
