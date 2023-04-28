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
import 'package:sira/view/widgets/applicant_card.dart';
import 'package:sira/view/widgets/applicant_count.dart';
import 'package:sira/view/widgets/field_validator.dart';
import 'package:sira/view/widgets/job_detail_card.dart';
import 'package:uuid/uuid.dart';

class JobApplicationpage extends StatefulWidget {
  const JobApplicationpage({super.key});

  @override
  State<JobApplicationpage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobApplicationpage> {
  final _formKey = GlobalKey<FormState>();
  final _bidPrice = TextEditingController();
  final _whyYou = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        title: Text(
          arguments['job'].jobTitle,
          style: TextStyle(
            color: CustomColors.blackTextColor,
            // fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.history,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outline,
              color: CustomColors.blackTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              JobDetailCard(
                applicaitionDeadline: arguments['job'].applicationDeadline,
                category: arguments['job'].category,
                desctiption: arguments['job'].jobDescription,
                priceLimit: arguments['job'].priceLimit,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Application Form",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextFormField(
                        controller: _bidPrice,
                        decoration: InputDecoration(
                          hintText: "Bid Price",
                          suffixIcon: Icon(
                            size: 20,
                            Icons.attach_money,
                            color: CustomColors.fadedTextColor,
                          ),
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
                        maxLines: 5,
                        controller: _whyYou,
                        decoration: InputDecoration(
                          hintText: "Why should we consider you?",
                          suffixIcon: Icon(
                            size: 20,
                            Icons.short_text,
                            color: CustomColors.fadedTextColor,
                          ),
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final uuid = Uuid();
            final bidId = uuid.v4().toString();

            final FirebaseAuth auth = FirebaseAuth.instance;

            final User? user = auth.currentUser;
            final userEmail = user!.email;

            try {
              Map<String, dynamic> ApplicationData = {
                "bid-id": bidId,
                "bid-price": _bidPrice.text,
                "job-id": arguments['job'].jobId,
                "why-you": _whyYou.text,
                "applicant-id": userEmail,
              };
              FirebaseFirestore.instance
                  .collection('Job Applications')
                  .doc(bidId)
                  .set(ApplicationData);

              FirebaseFirestore.instance
                  .collection('Jobs')
                  .doc(arguments['job'].jobId)
                  .update({'applicant-count': FieldValue.increment(1)});

              BlocProvider.of<JobBlocBloc>(context)
                  .add(AvailableJobsFetchEvent());
              Navigator.pushNamed(context, '/AvailableJobs');
              showSnackBar(
                  'You have Successfully Applied!', Colors.green, context);
            } catch (e) {
              showSnackBar(
                  e.toString(), Color.fromARGB(255, 95, 76, 75), context);
            }
          }
        },
        child: const Icon(Icons.check),
        tooltip: "Confirm.",
      ),
    );
  }
}
