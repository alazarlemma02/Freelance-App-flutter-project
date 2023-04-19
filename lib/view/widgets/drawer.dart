import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/sira_logo.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                color: CustomColors.backgroundColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: const SiraLogo(),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                        child: Row(
                      children: [
                        Icon(Icons.person),
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, '/ApplicantProfilePage');
                        }, child: Text('Profile')),
                      ],
                    )),
                    Container(
                        child: Row(
                      children: [
                        Icon(Icons.edit),
                        TextButton(onPressed: () {
                          Navigator.pushNamed(context, '/EditProfilePage');
                        }, child:Text('Edit Profile'))
                      ],
                    )),
                    Container(
                        child: Row(
                      children: [
                        Icon(Icons.logout),
                        TextButton(onPressed: () {
                          
                        }, child: Text('Logout'))
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}