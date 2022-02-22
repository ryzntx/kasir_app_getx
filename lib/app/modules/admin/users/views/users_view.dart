import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:get/get.dart';

import '../../../../constants/firebase_constant.dart';
import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  UsersController controller = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersView'),
        centerTitle: true,
        actions: [],
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(controller.users[index].name!),
                  subtitle: Text(controller.users[index].email!),
                  trailing: Text(
                    (controller.users[index].uid! == auth.currentUser!.uid)
                        ? 'Active User \n ${controller.users[index].role!}'
                        : controller.users[index].role!,
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
