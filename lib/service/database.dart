import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference usersWithCarCollection =
      FirebaseFirestore.instance.collection('UsersWithCar');
  final CollectionReference usersNoCarCollection =
      FirebaseFirestore.instance.collection('UsersNoCar');

  Future<void> updateUserWithCarData(String phoneNumber, String email,
      String firstName, String lastName, String date) async {
    return await usersWithCarCollection.doc(uid).set({
      'PhoneNumber': phoneNumber,
      'email': email,
      'Token': '',
      'firstName': firstName,
      'lastName': lastName,
      'BirthDate': date
    });
  }

  Future<void> updateUserNoCarData(String phoneNumber, String email,
      String firstName, String lastName, String date) async {
    return await usersNoCarCollection.doc(uid).set({
      'PhoneNumber': phoneNumber,
      'email': email,
      'Token': '',
      'firstName': firstName,
      'lastName': lastName,
      'BirthDate': date
    });
  }
}
