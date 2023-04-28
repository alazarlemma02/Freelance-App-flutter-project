import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/attachments.dart';
import 'package:sira/view/widgets/contact_detail.dart';
import 'package:sira/view/widgets/user_profile.dart';
import 'package:sira/view/widgets/user_type_skill.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Applicantprofile extends StatefulWidget {
  const Applicantprofile({super.key});

  @override
  State<Applicantprofile> createState() => _ApplicantprofileState();
}

class _ApplicantprofileState extends State<Applicantprofile> {
  String? imageUrl;

  getApplicantImage(String email) async {
    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('User Full Profile')
        .doc(email)
        .get();
    setState(() {
      imageUrl = userDoc.get('profile-image-url').toString();
    });
  }

  @override
  void initState() {
    getApplicantImage(imageUrl.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    getApplicantImage(arguments['user'].email);
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        title: Text(arguments['user'].fullName,
            style: TextStyle(color: CustomColors.blackTextColor)),
        actions: [
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined,
                color: CustomColors.blackTextColor),
          ),
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.08),
            onPressed: () {},
            icon: Icon(
              Icons.person_outlined,
              color: CustomColors.blackTextColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: CustomColors.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Image(
                        image: NetworkImage(imageUrl.toString()),
                        width: 100,
                        height: 100,
                      )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "name",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomColors.blackTextColor),
                              color: CustomColors.backgroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Category",
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text("desc"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrlString('tel://${arguments['user'].phoneNumber}');
        },
        child: Center(
            child: Icon(
          Icons.call,
          color: CustomColors.backgroundColor,
        )),
        backgroundColor: CustomColors.buttonBlueColor,
      ),
    );
  }
}
