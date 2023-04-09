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
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: SiraLogo(),
                    ),
                    Expanded(
                      flex: 60,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 100.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'welcome-back'.tr().toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  // color: CustomColors.blackTextColor,
                                ),
                              ),
                              Text(
                                'L-note'.tr().toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(size: 20, Icons.email),
                                  hintText: 'email'.tr()..toString(),
                                  labelStyle: const TextStyle(
                                    color: CustomColors.blackTextColor,
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
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextFormField(
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
                                        color: Color.fromRGBO(28, 33, 37, 100),
                                        size: 20,
                                      ),
                                    )),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(350, 10),
                                    backgroundColor:
                                        Color.fromRGBO(72, 165, 193, 1)),
                                onPressed: () {},
                                child: Text(
                                  'sign-in'.tr().toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(232, 244, 244, 1)),
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 10, right: 40),
                                child: Center(
                                  child: Row(children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 1,
                                      color: Color.fromRGBO(28, 33, 37, 1),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Text(
                                        'or'.tr().toString(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.only(right: 3),
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 1,
                                      color: Color.fromRGBO(28, 33, 37, 1),
                                    ),
                                  ]),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(350, 10),
                                    backgroundColor:
                                        Color.fromRGBO(28, 33, 37, 1)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: Text(
                                  'new-user'.tr().toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(232, 244, 244, 1)),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: Container(),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
