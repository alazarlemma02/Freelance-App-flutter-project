import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/screens/login_page.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/field_validator.dart';
import 'package:sira/view/widgets/sira_logo.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isloading = false;

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
                            'forgot-password'.tr().toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: CustomColors.blackTextColor,
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
                            validator: (value) =>
                                Validator.validateEmail(email: _email.text),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(350, 10),
                              backgroundColor: CustomColors.buttonBlueColor),
                          onPressed: _forgetPasswordSendEmail,
                          child: _isloading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: CustomColors.backgroundColor,
                                ))
                              : Text(
                                  'Reset Password'.tr().toString(),
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
      ),
    );
  }

  void _forgetPasswordSendEmail() async {
    setState(() {
      _isloading = true;
    });
    try {
      await _auth.sendPasswordResetEmail(
        email: _email.text,
      );

      showSnackBar('Check your Email box', Colors.green, context);
      await Navigator.pushNamed(context, '/');
    } catch (e) {
      if (_email.text.isEmpty) {
        showSnackBar('Please enter you email!', Colors.red, context);
      } else {
        showSnackBar('Incorrect Email Address Provided.', Colors.red, context);
      }
    }
    setState(() {
      _isloading = false;
    });
  }
}
