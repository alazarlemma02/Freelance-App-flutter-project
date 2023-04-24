import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/language_dropdown_selection.dart';
import 'package:sira/view/widgets/logout_page.dart';
import 'package:sira/view/widgets/sira_logo.dart';

class DrawerPage extends StatefulWidget {
  BuildContext context;
  DrawerPage({super.key, required this.context});

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
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/ApplicantProfilePage');
                                },
                                child: Text('Profile',
                                    style: TextStyle(
                                        color: CustomColors.blackTextColor))),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/EditProfilePage');
                                },
                                child: Text('Edit Profile',
                                    style: TextStyle(
                                        color: CustomColors.blackTextColor)))
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.language,
                                ),
                              ),
                              SelectLanguage(context: widget.context),
                            ],
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Logout(),
                            ]),
                      ),
                    )
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
