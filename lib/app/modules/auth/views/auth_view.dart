import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/modules/auth/views/widgets/bottom_text.dart';
import 'package:kasir_app_getx/app/modules/auth/views/widgets/login.dart';
import 'package:kasir_app_getx/app/modules/auth/views/widgets/register.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  AuthController controller = Get.find();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('AuthView'),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: controller.isLoginWidgetDisplayed.value,
                child: LoginWidget(),
              ),
              Visibility(
                visible: !controller.isLoginWidgetDisplayed.value,
                child: RegisterWidget(),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: controller.isLoginWidgetDisplayed.value,
                child: OutlineButton(
                  onPressed: () {
                    controller.changeDIsplayedAuthWidget();
                  },
                  child: Text('Register'),
                ),
              ),
              Visibility(
                visible: !controller.isLoginWidgetDisplayed.value,
                child: OutlineButton(
                  onPressed: () {
                    controller.changeDIsplayedAuthWidget();
                  },
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
