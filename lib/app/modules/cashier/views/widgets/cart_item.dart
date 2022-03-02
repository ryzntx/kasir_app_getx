import 'package:flutter/material.dart';

import 'package:kasir_app_getx/app/data/models/carts_model.dart';

class CartItemWidgets extends StatelessWidget {
  final CartsModel cartsModel;

  const CartItemWidgets({
    Key? key,
    required this.cartsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(cartsModel.name!),
            ],
          )
        ],
      ),
    );
  }
}
