import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';
import 'package:kasir_app_getx/app/data/models/menus_model.dart';

import '../../../../widgets/custom_text.dart';
import 'add_to_cart.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Avatar(
              useCache: true,
              sources: [
                NetworkSource(
                  menu.photo!,
                ),
              ],
              name: menu.name,
              shape: AvatarShape(
                width: MediaQuery.of(context).size.width,
                height: 100,
                shapeBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: CustomText(
              text: menu.name,
              size: 18,
              weight: FontWeight.bold,
            ),
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
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AddToCartWidgets(
                            title: menu.name!,
                            price: menu.price!,
                            image: menu.photo!,
                            menu: menu,
                          );
                        });
                  })
            ],
          ),
        ],
      ),
    );
  }
}
