import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kasir_app_getx/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:kasir_app_getx/app/modules/cashier/views/widgets/carts.dart';
import 'package:kasir_app_getx/app/widgets/logout_button.dart';

import '../controllers/cashier_controller.dart';
import 'widgets/products.dart';

class CashierView extends GetView<CashierController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [],
      )),
      appBar: AppBar(
        title: Text('CashierView'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Get.toNamed(Routes.CART);
                // showBarModalBottomSheet(
                //   context: context,
                //   builder: (context) => Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(16),
                //         topLeft: Radius.circular(16),
                //       ),
                //       color: Colors.white,
                //     ),
                //     child: CartWidgets(),
                //   ),
                // );
              }),
          LogoutButton(),
        ],
      ),
      body: Container(
        child: MenuListWidgets(),
      ),
    );
  }
}
