import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/widgets/logout_button.dart';

import '../controllers/cashier_controller.dart';

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
      body: Center(
        child: Text(
          'CashierView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
