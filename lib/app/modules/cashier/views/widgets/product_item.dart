import 'package:flutter/material.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';

import '../../../../widgets/custom_text.dart';

class MenuItemWidgets extends StatelessWidget {
  final Menu menu;

  const MenuItemWidgets({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 7,
              offset: Offset(3, 2)),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                menu.photo!,
                width: double.infinity,
              ),
            ),
          ),
          CustomText(
            text: menu.name,
            size: 18,
            weight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "Rp.${menu.price}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
