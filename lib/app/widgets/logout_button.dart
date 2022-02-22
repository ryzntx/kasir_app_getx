import 'package:flutter/material.dart';

import '../modules/auth/controllers/auth_controller.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        AuthController.authInstance.signOut();
      },
    );
  }
}
