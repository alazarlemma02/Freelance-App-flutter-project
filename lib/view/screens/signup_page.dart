import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/view/widgets/sira_logo.dart';

import '../../constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const SiraLogo(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          'welcome'.tr().toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          'S-note'.tr().toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              size: 20,
                              Icons.person,
                              color: CustomColors.fadedTextColor,
                            ),
                            hintText: 'full-name'.tr().toString(),
                            labelStyle: const TextStyle(
                              color: CustomColors.fadedTextColor,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              size: 20,
                              Icons.email,
                              color: CustomColors.fadedTextColor,
                            ),
                            hintText: 'email'.tr().toString(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              size: 20,
                              Icons.phone,
                              color: CustomColors.fadedTextColor,
                            ),
                            hintText: 'phone-number'.tr().toString(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                              hintText: 'password'.tr().toString(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: CustomColors.fadedTextColor,
                                  size: 20,
                                ),
                              )),
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                              hintText: 'C-password'.tr().toString(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: CustomColors.fadedTextColor,
                                  size: 20,
                                ),
                              )),
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColors.fadedTextColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            40,
                          ),
                          backgroundColor: CustomColors.buttonBlueColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/PathPage');
                        },
                        child: Text(
                          'sign-up'.tr().toString(),
                          style: TextStyle(
                            color: CustomColors.backgroundColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 1,
                                  color: CustomColors.fadedTextColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Text(
                                    'or'.tr().toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: CustomColors.fadedTextColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 1,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ]),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            40,
                          ),
                          backgroundColor: CustomColors.blackTextColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text(
                          'sign-in'.tr().toString(),
                          style: TextStyle(
                            color: CustomColors.backgroundColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
