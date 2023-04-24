import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class Validator {
  String? password;
  static String? validateName({required String fullName}) {
    if (fullName == null) {
      return null;
    }
    if (fullName.isEmpty) {
      return "empty-name".tr();
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return "empty-email".tr();
    } else if (!emailRegExp.hasMatch(email)) {
      return "incorrect-email".tr();
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return "empty-password".tr();
    } else if (password.length < 6) {
      return "password-length".tr();
    }
    return null;
  }

  static String? validatePhoneNumber({required String phoneNumber}) {
    if (phoneNumber == null) {
      return null;
    }
    if (phoneNumber.isEmpty) {
      return "phonenumber-empty".tr();
    } else if (!phoneNumber.startsWith('09')) {
      return "phonenumber-format".tr();
    }
    return null;
  }

  static String? validateProfileField({required String fieldData}) {
    if (fieldData == null) {
      return null;
    }
    if (fieldData.isEmpty) {
      return "empty-field".tr();
    }
  }

  static String? validateConfirmPassword(
      {required String confirmPassword, required String password}) {
    if (confirmPassword == null) {
      return null;
    }
    if (confirmPassword.isEmpty) {
      return "empty-password".tr();
    } else if (confirmPassword != password) {
      return "match-password".tr();
    }
    return null;
  }
}
