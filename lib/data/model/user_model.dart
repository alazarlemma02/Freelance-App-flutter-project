import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? userId;
  final String? fullName;
  String? email;
  final String? phoneNumber;
  final String? password;
  final String? userType;
  final String? socialMediaLink;
  final String? aboutYourself;

  UserModel({
    this.userId,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.userType,
    this.socialMediaLink,
    this.aboutYourself,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      userId: json["userId"],
      fullName: json["fullName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
      userType: json["userType"],
      socialMediaLink: json["socialMediaLink"],
      aboutYourself: json["aboutYourself"],
    );
  }
  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "userId": userId,
        "userType": userType,
      };

  void setUserEmail(String email) {
    this.email = email;
  }

  String? getUserEmail() {
    return email;
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        userType: doc.data().toString().contains('userType')
            ? doc.get('userType')
            : 'user not found');
  }
}
