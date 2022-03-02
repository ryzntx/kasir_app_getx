import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kasir_app_getx/app/constants/controllers.dart';
import 'package:kasir_app_getx/app/data/models/carts_model.dart';
import 'package:kasir_app_getx/app/modules/cashier/views/widgets/cart_item.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';

class CartWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart View'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_forever),
            tooltip: 'Delete all items',
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: cashierController.carts.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                child: ListTile(
                  title: Container(
                    child: Row(children: [
                      Column(
                        children: [
                          Text(cashierController.carts[index].name!),
                          Text(cashierController.carts[index].price.toString()),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    // return Stack(
    //   children: [
    //     Column(
    //       children: [
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Center(
    //           child: CustomText(
    //             text: "Shopping Cart",
    //             size: 24,
    //             weight: FontWeight.bold,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 5,
    //         ),
    //         Column(
    //           children: cashierController.carts.map((CartsModel carts) {
    //             return CartItemWidgets(cartsModel: carts);
    //           }).toList(),
    //         ),
    //       ],
    //     ),
    //     Positioned(
    //       bottom: 30,
    //       child: Container(
    //         width: MediaQuery.of(context).size.width,
    //         padding: EdgeInsets.all(8),
    //         child: CustomButton(
    //           text: 'Checkout',
    //           onTap: () {},
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
