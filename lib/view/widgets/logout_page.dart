import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/screens/signup_page.dart';
import 'package:sira/view/widgets/alert_dialog.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        IconButton(
            onPressed: () async {
              showDialog<void>(
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
                          Icons.logout,
                          color: CustomColors.buttonBlueColor,
                          size: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text(
                          'Do you want to logout?',
                          style: TextStyle(color: CustomColors.buttonBlueColor),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          // await logout;
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Yes',
                          style: TextStyle(color: CustomColors.buttonBlueColor),
                        ),
                        onPressed: () {
                          _signOut();
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ],
                  );
                },
              );

              //
            },
            icon: Icon(
              textDirection: TextDirection.ltr,
              Icons.logout,
              color: CustomColors.buttonBlueColor,
              size: MediaQuery.of(context).size.height*0.03,
            ))
      ]),
    );
  }
}