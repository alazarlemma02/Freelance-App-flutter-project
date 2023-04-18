import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/firebase_authentication.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/field_validator.dart';
import 'package:sira/view/widgets/sira_logo.dart';

import '../../constants/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  final _fullName = TextEditingController();
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    context.locale = const Locale('en', 'US');
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
              child: Form(
                key: _formKey,
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
                          child: TextFormField(
                            controller: _fullName,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                size: 20,
                                Icons.person_outline,
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
                            validator: (value) =>
                                Validator.validateName(fullName: value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: TextFormField(
                            controller: _email,
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
                            validator: (value) =>
                                Validator.validateEmail(email: value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: TextFormField(
                            controller: _phoneNumber,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Color.fromRGBO(28, 33, 37, 1),
                                ),
                              ),
                              hintText: 'phone-number'.tr().toString(),
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors.fadedTextColor,
                            ),
                            validator: (value) => Validator.validatePhoneNumber(
                                phoneNumber: value!),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: TextFormField(
                            controller: _pass,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Color.fromRGBO(28, 33, 37, 1),
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
                            validator: (value) =>
                                Validator.validatePassword(password: value!),
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
                            validator: (value) =>
                                Validator.validateConfirmPassword(
                                    confirmPassword: value!,
                                    password: _pass.text),
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
                          onPressed: _signUp,
                          child: _isloading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      color: CustomColors.backgroundColor),
                                )
                              : Text(
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
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
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
                              backgroundColor: CustomColors.blackTextColor),
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
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isloading = true;
      });
      // Logging in the user w/ Firebase
      String result = await FireAuth().registerUsingEmailPassword(
          fullName: _fullName.text,
          email: _email.text,
          phoneNumber: _phoneNumber.text,
          password: _pass.text,
          context: context);
      if (result != 'true') {
        showSnackBar('Some error ocurred Try again', Colors.red, context);
      } else {
        showSnackBar('Registered Successfully', Colors.green, context);
        await Navigator.pushNamed(context, '/AvailableJobs');
        showSnackBar('Welcome', CustomColors.buttonBlueColor, context);
      }
      setState(() {
        _isloading = false;
      });
    }
  }
}
