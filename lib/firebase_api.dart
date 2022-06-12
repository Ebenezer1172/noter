import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noter/note_model.dart';

String id = '';
DateTime createdTime = DateTime.now();

class FirebaseApi {
  static Future<String> createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('Noter').doc();
    user.id = docUser.id;
    await docUser.set(user.toJson());

    return docUser.id;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readUsers() =>
      FirebaseFirestore.instance.collection('Noter').snapshots();

      static Future updateUser(User user) async {
        final docUser = FirebaseFirestore.instance.collection('Noter').doc(user.id);

        await docUser.update(user.toJson());
      }

      static Future deleteUser(User user) async {
        final docUser = FirebaseFirestore.instance.collection('Noter').doc(user.id);

        await docUser.delete();
      }
} 