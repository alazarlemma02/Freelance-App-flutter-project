import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      backgroundColor: CustomColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: 150,
                        child: const Image(
                          image: AssetImage('assets/images/Logo(1X).png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 80,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Welcome',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                              Text(
                                'Please fill in the required fields to sign-up.',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    size: 20,
                                    Icons.person_outline,
                                  ),
                                  hintText: 'Full Name',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color.fromRGBO(28, 33, 37, 1),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(size: 20, Icons.email),
                                  hintText: 'Email',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color.fromRGBO(28, 33, 37, 1),
                                    ),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextFormField(
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(28, 33, 37, 1),
                                      ),
                                    ),
                                    hintText: 'Password',
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
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.fadedTextColor,
                                ),
                              ),
                              TextFormField(
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(28, 33, 37, 1),
                                      ),
                                    ),
                                    hintText: 'Confirm Password',
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
                                style: TextStyle(
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
                                  'Sign-up',
                                  style: TextStyle(
                                      color: Color.fromRGBO(232, 244, 244, 1)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Row(children: [
                                  Container(
                                    width: 150,
                                    height: 1,
                                    color: Color.fromRGBO(28, 33, 37, 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Text('or'),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 3),
                                    width: 130,
                                    height: 1,
                                    color: Color.fromRGBO(28, 33, 37, 1),
                                  ),
                                ]),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(350, 10),
                                    backgroundColor:
                                        Color.fromRGBO(28, 33, 37, 1)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Text(
                                  'Sign-in',
                                  style: TextStyle(
                                      color: Color.fromRGBO(232, 244, 244, 1)),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
