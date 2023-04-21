
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';

Future<void> showAlertMessage(

  BuildContext context,
) async {
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

            Text(
              'Please choose an option',
              style: TextStyle(color: CustomColors.blackTextColor),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
               "Camera",
              style: TextStyle(color: CustomColors.buttonBlueColor),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/SignUpPage');
              // await logout;
            },
          ),
          TextButton(
            child: Text(
              "Gallery",
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

