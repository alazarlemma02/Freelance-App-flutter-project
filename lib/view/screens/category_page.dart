import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Category_page extends StatefulWidget {
  const Category_page({super.key});

  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Image(
                    width: 150,
                    image: AssetImage('asset/images/Logo(1X).png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 100, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I specialize in...',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        'Please pick one',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(40, 30, 35, 50),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Radio(
                                value: "finance",
                                groupValue: category,
                                onChanged: (value) {
                                  setState(() {
                                    category = value.toString();
                                  });
                                }),
                            Text('Finance')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Radio(
                                  value: "design and Creativity",
                                  groupValue: category,
                                  onChanged: (value) {
                                    setState(() {
                                      category = value.toString();
                                    });
                                  }),
                              Text('Design and Creativity')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Radio(
                                  value: "Engineering & Architecture",
                                  groupValue: category,
                                  onChanged: (value) {
                                    setState(() {
                                      category = value.toString();
                                    });
                                  }),
                              Text('Engineering & Architecture')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Radio(
                                  value: "Writing",
                                  groupValue: category,
                                  onChanged: (value) {
                                    setState(() {
                                      category = value.toString();
                                    });
                                  }),
                              Text('Writing')
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Radio(
                                  value: "Web, Mobile & Software Development",
                                  groupValue: category,
                                  onChanged: (value) {
                                    setState(() {
                                      category = value.toString();
                                    });
                                  }),
                              Text('Web, Mobile & Software Development')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  width: 330,
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
      ),
    );
  }
}
