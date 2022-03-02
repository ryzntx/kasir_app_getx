import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';

import 'package:kasir_app_getx/app/constants/controllers.dart';
import 'package:kasir_app_getx/app/widgets/custom_button.dart';

import '../../../../widgets/custom_text.dart';

class AddToCartWidgets extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Menu menu;

  const AddToCartWidgets({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Avatar(
                        useCache: true,
                        sources: [
                          NetworkSource(image),
                        ],
                        name: title,
                        shape: AvatarShape(
                          width: 110,
                          height: 110,
                          shapeBorder: RoundedRectangleBorder(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: Theme.of(context).textTheme.headline6),
                            Text('Rp.$price',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jumlah',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Obx(
                        () => Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cashierController.decrement();
                                },
                                icon: Icon(Icons.chevron_left),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: CustomText(
                                    text: cashierController.count.value
                                        .toString()),
                              ),
                              IconButton(
                                onPressed: () {
                                  cashierController.increment();
                                },
                                icon: Icon(Icons.chevron_right),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  ElevatedButton(
                      onPressed: () {
                        cashierController.addToCart(menu);
                      },
                      child: Text('Tambahkan'))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
