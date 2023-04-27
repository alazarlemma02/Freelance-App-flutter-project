import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? userId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  String? userType;
  String? socialMediaLink;
  String? aboutYourself;
  String? userToken;
  String? profileTagLine;
  String? category;
  String? skillLevel;
  String? experienceLevel;
  String? educationLevel;
  String? profileImage;
  String? attachmentUrl;

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
      this.experienceLevel,
      this.profileImage,
      this.attachmentUrl});

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
        profileImage: json["profile-image-url"],
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
        "about-yourself": aboutYourself,
        "attachment-url": attachmentUrl,
        "profile-image-url": profileImage
      };

  UserModel.fromSnapshot(snapshot)
      : fullName = snapshot.data()['fullName'],
        category = snapshot.data()['category'],
        skillLevel = snapshot.data()['skill-level'],
        aboutYourself = snapshot.data()['about-yourself'],
        attachmentUrl = snapshot.data()['attachment-url'],
        phoneNumber = snapshot.data()['phone-number'],
        email = snapshot.data()['email'],
        profileImage = snapshot.data()['profile-image-url'],
        profileTagLine = snapshot.data()['Profile-tag-line'],
        socialMediaLink = snapshot.data()['social-media-link'];

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
