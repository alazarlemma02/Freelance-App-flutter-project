import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:sira/constants/colors.dart';
import 'package:sira/main.dart';
import 'package:sira/view/widgets/attachments.dart';
import 'package:sira/view/widgets/contact_detail.dart';
import 'package:sira/view/widgets/user_profile.dart';
import 'package:sira/view/widgets/user_type_skil.dart';

class My_profile extends StatefulWidget {
  const My_profile({super.key});

  @override
  State<My_profile> createState() => _My_profileState();
}

class _My_profileState extends State<My_profile> {
  String? fullName;
  String? phoneNumber;
  Future<void> getNameOfUser() async {
    DocumentSnapshot profileName = await FirebaseFirestore.instance
        .collection('users')
        .doc('nahom@gmail.com')
        .get();

    fullName = profileName['fullName'];
  }

  @override
  void initState() {
    super.initState();
    getNameOfUser();
  }

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
        title: Text(fullName.toString(),
            style: TextStyle(color: CustomColors.blackTextColor)),
        actions: [
          IconButton(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            onPressed: () {},
            icon: Icon(Icons.access_time_rounded,
                color: CustomColors.blackTextColor),
          ),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
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
                            width: MediaQuery.of(context).size.height * 0.6,
                            child: Column(
                              children: [
                                const UserTypeAndSkill(),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: Text(
                                    "Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. Placeholder text that is basically a short description of the person. ",
                                    style: TextStyle(
                                        color: CustomColors.blackTextColor),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width:
                                      MediaQuery.of(context).size.height * 0.4,
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
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    'contact-details'.tr().toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const ContactDetail(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Center(
            child: Icon(
          Icons.edit,
          color: CustomColors.backgroundColor,
        )),
        backgroundColor: CustomColors.buttonBlueColor,
      ),
    );
  }
}
