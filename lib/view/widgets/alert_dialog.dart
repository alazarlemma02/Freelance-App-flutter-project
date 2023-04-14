import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';

Future<void> showAlertMessage(final IconData dialogIcon, String textMessage,
    bool isCorrect, Color iconColor, BuildContext context) async {
  return showDialog<void>(
    context: context,

    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 1,
        // title: const Text('AlertDialog Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              dialogIcon,
              color: iconColor,
              size: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              textMessage,
              style: TextStyle(color: iconColor),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Sign up',
              style: TextStyle(color: CustomColors.buttonBlueColor),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/SignUpPage');
            },
          ),
          TextButton(
            child: const Text(
              'try again',
              style: TextStyle(color: CustomColors.buttonBlueColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void showSnackBar(String messege, Color color, BuildContext context) {
  final snackBar = SnackBar(
    backgroundColor: CustomColors.backgroundColor,
    content: Text(
      messege,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
