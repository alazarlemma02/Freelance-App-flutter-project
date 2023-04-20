import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:uuid/uuid.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  final _formKey = GlobalKey<FormState>();
  final _jobTitle = TextEditingController();
  final _category = TextEditingController();
  final _applicationDeadline = TextEditingController();
  final _priceRange = TextEditingController();
  final _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
        title: Text("Add a New Job"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  "Please be  as concise and brief as posssible.",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: CustomColors.blackTextColor,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TextFormField(
                      controller: _jobTitle,
                      decoration: InputDecoration(
                        hintText: "Job Title",
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
                    child: TextFormField(
                      controller: _category,
                      decoration: InputDecoration(
                        hintText: "Category",
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
                    child: TextFormField(
                      controller: _applicationDeadline,
                      decoration: InputDecoration(
                        hintText: "Applicatiion Deadline (dd/mm/yyyy)",
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
                    child: TextFormField(
                      controller: _priceRange,
                      decoration: InputDecoration(
                        hintText: "Price Limit",
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
                    child: TextFormField(
                      controller: _description,
                      decoration: InputDecoration(
                        hintText: "Description",
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
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var uuid = Uuid();
          try {
            Map<String, dynamic> jobData = {
              "job-title": _jobTitle.text,
              "category": _category.text,
              "application-deadline": _applicationDeadline.text,
              "price-limit": _priceRange.text,
              "description": _description.text
            };
            FirebaseFirestore.instance
                .collection('Jobs')
                .doc(uuid.v4().toString())
                .set(jobData);
            Navigator.pushNamed(context, '/PostedJobs');
          } catch (e) {
            showSnackBar(e.toString(), Colors.red, context);
          }
        },
        child: const Icon(Icons.check),
        tooltip: "Confirm.",
      ),
    );
  }
}
