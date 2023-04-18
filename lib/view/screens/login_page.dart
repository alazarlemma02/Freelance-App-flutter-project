import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/language_dropdown_selection.dart';
import 'package:sira/view/widgets/sira_logo.dart';

import '../../constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final _pass = TextEditingController();
  bool _isloading = false;
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                          'welcome-back'.tr().toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          'L-note'.tr().toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
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
                              Icons.email,
                              color: CustomColors.fadedTextColor,
                            ),
                            hintText: 'email'.tr()..toString(),
                            labelStyle: const TextStyle(
                              color: CustomColors.fadedTextColor,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextFormField(
                          controller: _pass,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                              hintText: 'password'.tr().toString(),
                              labelStyle: const TextStyle(
                                  color: CustomColors.blackTextColor),
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
                          style: const TextStyle(
                            fontSize: 12,
                            color: CustomColors.blackTextColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // fixedSize: const Size(350, 10),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width,
                              40,
                            ),
                            backgroundColor: CustomColors.buttonBlueColor),
                        onPressed: () {
                          // Navigator.pushNamed(context, '/AvailableJobs');
                        },
                        child: _isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: CustomColors.backgroundColor,
                                ),
                              )
                            : Text(
                                'sign-in'.tr().toString(),
                                style: const TextStyle(
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
                          Navigator.pushNamed(context, '/SignUpPage');
                        },
                        child: Text(
                          'new-user'.tr().toString(),
                          style: const TextStyle(
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
