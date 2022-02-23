import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/widgets/logout_button.dart';

import '../controllers/cashier_controller.dart';
import 'widgets/products.dart';

class CashierView extends GetView<CashierController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CashierView'),
        centerTitle: true,
        actions: [
          LogoutButton(),
        ],
      ),
      body: Container(
        child: MenuListWidgets(),
      ),
    );
  }
}
