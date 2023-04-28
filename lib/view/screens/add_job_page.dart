import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sira/bloc/job_bloc_bloc.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/alert_dialog.dart';
import 'package:sira/view/widgets/field_validator.dart';
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
        title: Text(
          'Add-a-job'.tr().toString(),
          style: TextStyle(
            color: CustomColors.blackTextColor,
            // fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                  "Please be  as concise and brief as posssible."
                      .tr()
                      .toString(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: CustomColors.blackTextColor,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        controller: _jobTitle,
                        decoration: InputDecoration(
                          hintText: "job-title".tr().toString(),
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
                            Validator.validateProfileField(fieldData: value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        controller: _category,
                        decoration: InputDecoration(
                          hintText: "category".tr().toString(),
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
                            Validator.validateProfileField(fieldData: value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        controller: _applicationDeadline,
                        decoration: InputDecoration(
                          hintText: "application-deadline".tr().toString(),
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
                            Validator.validateProfileField(fieldData: value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        controller: _priceRange,
                        decoration: InputDecoration(
                          hintText: "price-limit".tr().toString(),
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
                            Validator.validateProfileField(fieldData: value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        maxLines: 3,
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: "description".tr().toString(),
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
                            Validator.validateProfileField(fieldData: value!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final uuid = Uuid();
            final jobId = uuid.v4().toString();

            final FirebaseAuth auth = FirebaseAuth.instance;

            final User? user = auth.currentUser;
            final userId = user!.uid;

            try {
              Map<String, dynamic> jobData = {
                "job-id": jobId,
                "job-title": _jobTitle.text,
                "category": _category.text,
                "application-deadline": _applicationDeadline.text,
                "price-limit": _priceRange.text,
                "description": _description.text,
                "due-date": "-",
                "deadline-date": "-",
                "posted-by": userId,
                "applicant-count": 0,
              };
              FirebaseFirestore.instance
                  .collection('Jobs')
                  .doc(jobId)
                  .set(jobData);

              BlocProvider.of<JobBlocBloc>(context).add(PostedJobsFetchEvent());
              await Navigator.pushNamed(context, '/PostedJobs');
              showSnackBar("job-added-Successfully".tr().toString(),
                  Colors.green, context);
            } catch (e) {
              showSnackBar(e.toString(), Colors.red, context);
            }
          }
        },
        child: const Icon(Icons.check),
        tooltip: "confirm".tr().toString(),
      ),
    );
  }
}
