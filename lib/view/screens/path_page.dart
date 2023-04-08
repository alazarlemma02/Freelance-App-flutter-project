import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class Path_page extends StatefulWidget {
  Path_page({super.key});

  @override
  State<Path_page> createState() => _Path_pageState();
}

class _Path_pageState extends State<Path_page> {
  String? pathGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image(
                  width: 150,
                  image: AssetImage('asset/images/Logo(1X).png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: 300,
                        child: Text(
                          'I am...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Text(
                        'Please pick one',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 35, 50),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80),
                                        child: Radio(
                                            value: "Freelancer",
                                            groupValue: pathGroup,
                                            onChanged: (value) {
                                              setState(() {
                                                pathGroup = value.toString();
                                              });
                                            }),
                                      ),
                                      Image(
                                        height: 125,
                                        width: 125,
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            'asset/images/suitcase.png'),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top:10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'A Freelancer',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Looking for a job',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80),
                                          child: Radio(
                                              value: "Employer",
                                              groupValue: pathGroup,
                                              onChanged: (value) {
                                                setState(() {
                                                  pathGroup = value.toString();
                                                });
                                              }),
                                        ),
                                        Image(
                                          height: 125,
                                          width: 125,
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'asset/images/Tie.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:10.0),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'An Employer',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          'Looking to hire',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 30, 40, 100),
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/category_page');
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 15.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
