import 'package:cloud_firestore/cloud_firestore.dart';

class CartsModel {
  static const ID = "id";
  static const PHOTO = "photo";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const MENU_ID = "menuId";

  String? id;
  String? photo;
  String? name;
  int? quantity;
  double? cost;
  String? menuId;
  double? price;

  CartsModel({
    this.id,
    this.photo,
    this.name,
    this.quantity,
    this.cost,
    this.menuId,
    this.price,
  });

  CartsModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    photo = snapshot.get(PHOTO);
    name = snapshot.get(NAME);
    quantity = snapshot.get(QUANTITY);
    cost = snapshot.get(COST);
    menuId = snapshot.get(MENU_ID);
    price = snapshot.get(PRICE);
  }

  CartsModel.fromJson(Map<String, dynamic> data) {
    id = data[ID];
    photo = data[PHOTO];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    menuId = data[MENU_ID];
    price = data[PRICE].toDouble();
  }
}
