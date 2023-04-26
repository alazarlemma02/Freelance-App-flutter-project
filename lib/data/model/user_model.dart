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
  final String? userToken;
  final String? profileTagLine;
  final String? category;
  final String? skillLevel;
  final String? experienceLevel;
  final String? educationLevel;

  UserModel(
      {this.userId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.password,
      this.userType,
      this.socialMediaLink,
      this.aboutYourself,
      this.userToken,
      this.profileTagLine,
      this.category,
      this.skillLevel,
      this.educationLevel,
      this.experienceLevel});

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
        userToken: json["userToken"],
        profileTagLine: json["Profile-tag-line"],
        category: json["category"],
        skillLevel: json["skill-level"],
        experienceLevel: json["experience-level"],
        educationLevel: json["education-level"]);
  }
  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "userId": userId,
        "userType": userType,
        "userToken": userToken,
        "Profile-tag-line": profileTagLine,
        "category": category,
        "skill-level": skillLevel,
        "phone-number": phoneNumber,
        "experience-level": experienceLevel,
        "education-level": educationLevel,
        "social-media-link": socialMediaLink,
        "about-yourself": aboutYourself
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
