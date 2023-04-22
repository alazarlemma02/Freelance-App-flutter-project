import 'package:flutter/cupertino.dart';

class Validator {
  String? password;
  static String? validateName({required String fullName}) {
    if (fullName == null) {
      return null;
    }
    if (fullName.isEmpty) {
      return 'Name can\'t be empty';
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
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    } 
    return null;
  }

  static String? validatePhoneNumber({required String phoneNumber}) {
    if (phoneNumber == null) {
      return null;
    }
    if (phoneNumber.isEmpty) {
      return 'Phone Number can\'t be empty';
    } else if (!phoneNumber.startsWith('09')) {
      return 'Incorrect phone number format';
    }
    return null;
  }

  static String? validateProfileField({required String fieldData}) {
    if (fieldData == null) {
      return null;
    }
    if (fieldData.isEmpty) {
      return 'Please fill in the field!';
    }
  }

  static String? validateConfirmPassword(
      {required String confirmPassword, required String password}) {
    if (confirmPassword == null) {
      return null;
    }
    if (confirmPassword.isEmpty) {
      return 'Confirm Password can\'t be empty';
    } else if (confirmPassword != password) {
      return 'The password doesn\'t match.';
    }
    return null;
  }
}
