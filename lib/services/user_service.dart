import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makemywindoor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late SharedPreferences prefs;

  User? currentUser;

  saveState() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(currentUser?.toMap()));
    log(prefs.getString("user").toString());
  }

  Future<User?> getState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      currentUser = User.fromMap(json.decode(prefs.getString('user')!));
      return currentUser;
    }
    return null;
  }

  Future<User?> login(String phone) async {
    DocumentSnapshot<Map<String, dynamic>> d = await getUser(phone);
    if (d.exists) {
      currentUser = User.fromMap(d.data()!);
      return currentUser;
    }
    return User.empty();
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    currentUser = null;
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
