import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  static const UID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ROLE = "role";

  String? uid;
  String? name;
  String? email;
  String? role;

  Users({this.uid, this.name, this.email, this.role});

  Users.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.get(NAME);
    email = snapshot.get(EMAIL);
    role = snapshot.get(ROLE);
    uid = snapshot.get(UID);
  }

  Users.fromMap(DocumentSnapshot snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    role = snapshot[ROLE];
    uid = snapshot.id;
  }
}
