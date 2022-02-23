import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({Key? key}) : super(key: key);

  AuthController controller = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Membuat akun baru',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Harap masukan Nama';
                        }
                        controller.name.text = name;
                        return null;
                      },
                      controller: controller.name,
                      decoration: InputDecoration(
                        label: const Text('Nama'),
                        labelStyle: TextStyle(
                            color: controller.focusNode.hasFocus
                                ? Colors.blue
                                : Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (email) {
                        if (email!.isEmpty) {
                          return 'Harap masukan Email';
                        }
                        controller.email.text = email;
                        return null;
                      },
                      controller: controller.email,
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        labelStyle: TextStyle(
                            color: controller.focusNode.hasFocus
                                ? Colors.blue
                                : Colors.grey),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Harap masukan Password';
                        }
                        controller.password.text = password;
                        return null;
                      },
                      controller: controller.password,
                      focusNode: controller.focusNode,
                      obscureText: controller.passwordVisible.value,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        labelStyle: TextStyle(
                            color: controller.focusNode.hasFocus
                                ? Colors.blue
                                : Colors.grey),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.isLoading.isFalse;
                        if (_formKey.currentState!.validate()) {
                          controller.isLoading.isTrue;
                          AuthController.instance.register();
                        }
                      },
                      child: Text(controller.isLoading.value
                          ? 'Harap tunggu...'
                          : 'Register'),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
