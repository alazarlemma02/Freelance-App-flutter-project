import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/data/services/firebase_api_services.dart';
import 'package:sira/data/services/firebase_authentication.dart';
import 'package:sira/main.dart';
import 'package:sira/view/screens/avilable_jobs_page.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/field_validator.dart';
import 'package:sira/view/widgets/language_dropdown_selection.dart';
import 'package:sira/view/widgets/sira_logo.dart';

import '../../constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const AvailableJobs(),
        ),
      );
    }
    return firebaseApp;
  }

  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;
  bool _passwordVisible = false;
  String? userType;

  FirebaseApiServices firebaseApiServices = FirebaseApiServices();
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: null,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
            child: SelectLanguage(context: context),
          ),
        ],
      ),
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
                          child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                size: 20,
                                Icons.email,
                                color: CustomColors.fadedTextColor,
                              ),
                              hintText: 'email'.tr().toString(),
                              labelStyle: const TextStyle(
                                color: CustomColors.fadedTextColor,
                                fontSize: 12,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 12,
                              color: CustomColors.blackTextColor,
                            ),
                            validator: (value) =>
                                Validator.validateEmail(email: _email.text),
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
                                    fontSize: 12,
                                    color: CustomColors.fadedTextColor),
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
                            validator: (value) => Validator.validatePassword(
                                password: _pass.text),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            firebaseApiServices.initUserType();
                          },
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                // fixedSize: const Size(350, 10),
                                minimumSize:
                                    Size(MediaQuery.of(context).size.width, 40),
                                backgroundColor: CustomColors.buttonBlueColor),
                            onPressed: _signInUser,
                            child: _isloading
                                ? Stack(
                                    children: [
                                      Center(
                                          child: CircularProgressIndicator(
                                        color: CustomColors.backgroundColor,
                                      )),
                                    ],
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
                            // fixedSize: const Size(350, 10),
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 40),
                            backgroundColor: CustomColors.blackTextColor,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/PathPage');
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
                        Center(
                          child: TextButton(
                            child: Text(
                              "forgot-password".tr(),
                              style: TextStyle(
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/ForgotPasswordPage');
                            },
                          ),
                        )
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

  void _signInUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_email.text.isEmpty) {
        showSnackBar('Email is empty', Colors.red, context);
      } else if (_pass.text.isEmpty) {
        showSnackBar('password is empty', Colors.red, context);
      } else {
        setState(() {
          _isloading = true;
        });
        String? type = await FireAuth().checkUserTypeWhileSignin(
          email: _email.text,
          password: _pass.text,
        );
        String result = await FireAuth().signInUsingEmialPassword(
          email: _email.text,
          password: _pass.text,
        );

        if (result != 'true') {
          showAlertMessage(
            Icons.error,
            'User not found',
            false,
            Colors.red,
            context,
          );
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          showSnackBar('Logged In Successfully', Colors.green, context);
          if (type == 'Freelancer') {
            prefs.setString('userRoute', '/AvailableJobs');
            await Navigator.pushNamed(context, '/AvailableJobs');
          } else if (type == 'Employer') {
            prefs.setString('userRoute', '/PostedJobs');
            await Navigator.pushNamed(context, '/PostedJobs');
            BlocProvider.of<JobBlocBloc>(context).add(const JobsFetchEvent());
          }
        }
        setState(() {
          _isloading = false;
        });
      }
    }
  }
}
