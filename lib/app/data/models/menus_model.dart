import 'package:cloud_firestore/cloud_firestore.dart';

class Menu {
  static const NAME = "name";
  static const PRICE = "price";
  static const PHOTO = "photo";

  String? id;
  String? name;
  String? price;
  String? photo;

  Menu({this.id, this.name, this.price, this.photo});

  Menu.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.get(NAME);
    price = snapshot.get(PRICE);
    photo = snapshot.get(PHOTO);
  }

  Menu.fromMap(DocumentSnapshot snapshot) {
    name = snapshot[NAME];
    price = snapshot[PRICE];
    photo = snapshot[PHOTO];
    id = snapshot.id;
  }

  // Menu.fromJson(Map<String, Object?> json)
  //     : this(
  //         nama: json['nama']! as String,
  //         harga: json['harga']! as String,
  //         foto: json['foto']! as String,
  //       );

  // Map<String, Object?> toJson() {
  //   return {
  //     'nama': nama,
  //     'harga': harga,
  //     'foto': foto,
  //   };
  // }
}
