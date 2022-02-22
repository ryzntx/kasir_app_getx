import 'package:flutter/material.dart';

class ItemHeaderWidgets extends StatelessWidget {
  const ItemHeaderWidgets({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
