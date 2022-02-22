import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kasir_app_getx/app/modules/admin/views/admin_view.dart';
import 'package:kasir_app_getx/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(()=>Column(children: [
          Text(
            'HomeView is working ${controller.count}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){Get.toNamed(Routes.ADMIN);}, child: Text('Change Screen'))
        ],)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){controller.increment();}, child: Icon(Icons.add),),
    );
  }
}
