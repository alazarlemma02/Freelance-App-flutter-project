import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/widgets/alert_dialog.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        IconButton(
            onPressed: () async {
              showAlertMessage(
                Icons.logout,
                'Do You want to logout',
                true,
                CustomColors.buttonBlueColor,
                context,
              );

              // await FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              textDirection: TextDirection.ltr,
              Icons.logout,
              color: CustomColors.buttonBlueColor,
            ))
      ]),
    );
  }
}
