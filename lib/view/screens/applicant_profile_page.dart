import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/attachments.dart';
import 'package:sira/view/widgets/contact_detail.dart';
import 'package:sira/view/widgets/user_profile.dart';
import 'package:sira/view/widgets/user_type_skill.dart';

class Applicantprofile extends StatefulWidget {
  const Applicantprofile({super.key});

  @override
  State<Applicantprofile> createState() => _ApplicantprofileState();
}

class _ApplicantprofileState extends State<Applicantprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.transparentColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: CustomColors.blackTextColor,
        ),
        title: Text('Abebe Kebede',
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CustomColors.backgroundColor,
        child: Column(
          children: [
            Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                      ),

                      ///here we create space for the circle avatar to get ut of the box
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: CustomColors.cardColor,
                        ),
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          children: [
                            const UserTypeAndSkill(),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: Text(
                                "Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. ",
                                style: TextStyle(
                                    color: CustomColors.blackTextColor),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: AttachmentFile(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const UserProfilePicture(),

                    ///Image Avatar
                  ],
                ),
              ),
            ]),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'contact-details'.tr().toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.25,
                              MediaQuery.of(context).size.height * 0.009),
                          backgroundColor: CustomColors.buttonBlueColor),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "call-now".tr().toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ]),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.085,
                  right: MediaQuery.of(context).size.width * 0.085),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(),
            ),
            const ContactDetail(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/EditProfilePage');
        },
        child: Center(
            child: Icon(
          Icons.done,
          color: CustomColors.backgroundColor,
        )),
        backgroundColor: CustomColors.buttonBlueColor,
      ),
    );
  }
}
