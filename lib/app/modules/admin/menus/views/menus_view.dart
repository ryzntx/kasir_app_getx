import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_divider/text_divider.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  MenusController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenusView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(controller.menu[index].name!),
                subtitle: Text(controller.menu[index].price!),
                trailing: IconButton(
                  icon: Icon(Icons.delete_forever),
                  onPressed: () {
                    displayDeleteDialog(controller.menu[index].id!);
                  },
                ),
                onTap: () {
                  controller.nameMenu.text = controller.menu[index].name!;
                  controller.priceMenu.text = controller.menu[index].price!;
                  _buildAddEditEmployeeView(
                      text: 'Update',
                      addEditFlag: 2,
                      docId: controller.menu[index].id!);
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('ADD MENU'),
        onPressed: () {
          _buildAddEditEmployeeView(text: 'Add', addEditFlag: 1, docId: '');
        },
      ),
    );
  }

  _buildAddEditEmployeeView(
      {String? text, int? addEditFlag, String? docId, BuildContext? context}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDivider.horizontal(
                    text: Text(
                      '${text} Menu',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Stack(children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color:
                                  Theme.of(context!).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          child: ClipOval(
                            child: SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (controller.picker == null)
                                  ? null
                                  : Image.file(
                                      controller.image!,
                                      fit: BoxFit.cover,
                                    ),
                              // Image.file(
                              //   _image,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: MaterialButton(
                            color: Colors.primaries[17],
                            textColor: Colors.white,
                            child: const Icon(
                              Icons.camera_alt,
                              size: 22,
                            ),
                            padding: const EdgeInsets.all(2),
                            shape: const CircleBorder(),
                            onPressed: () => Get.bottomSheet(
                              Container(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: const Text("Kamera"),
                                      subtitle: const Text(
                                          "Ambil foto dari kamera anda"),
                                      leading: const Icon(Icons.camera_alt),
                                      onTap: () async {
                                        controller.pickImageFromCamera();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      title: const Text("Galeri"),
                                      subtitle: const Text(
                                          "Ambil foto dari galeri hp anda"),
                                      leading: const Icon(Icons.image_rounded),
                                      onTap: () async {
                                        controller.pickImageFromGallery();
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.nameMenu,
                    validator: (value) {
                      return controller.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Harga Menu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    controller: controller.priceMenu,
                    validator: (value) {
                      return controller.validatePrice(value!);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        controller.saveUpdateEmployee(controller.nameMenu.text,
                            controller.priceMenu.text, docId!, addEditFlag!);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Menu",
      titleStyle: TextStyle(fontSize: 20),
      content: Text(
        "Are you sure you want to delete this menu?",
        textAlign: TextAlign.center,
      ),
      confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: () {
            controller.deleteData(docId);
          },
          child: Text("Confirm")),
      cancel: OutlineButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel")),
    );
  }
}
