import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makemywindoor/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late SharedPreferences prefs;

  late User currentUser;

  saveState() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(currentUser.toJson()));
    log(prefs.getString("user").toString());
  }

  Future<User?> getState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      currentUser = User.fromJson(json.decode(prefs.getString('user')!));
      return currentUser;
    }
    return null;
  }

  Future<User?> login(String phone) async {
    DocumentSnapshot<Map<String, dynamic>> d = await getUser(phone);
    if (d.exists) {
      currentUser = User.fromJson(d.data()!);
      return currentUser;
    }
    return User.empty();
  }

  void createUser(Map<String, dynamic> values) {
    log("Creating user" + values.toString());
    _firestore.collection('users').doc(values['phone']).set(values);
  }

  void updateUser(Map<String, dynamic> values) {
    _firestore.collection('users').doc(values['phone']).update(values);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String phone) {
    return _firestore.collection('users').doc(phone).get();
  }

  Future<QuerySnapshot> getUsers() {
    return _firestore.collection('users').get();
  }

  Future<QuerySnapshot> getUsersByUid(int uid) {
    return _firestore.collection('users').where('uid', isEqualTo: uid).get();
  }
}
