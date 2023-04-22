import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class ContactDetail extends StatefulWidget {
  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  String? email;
  String? socialMedia;
  String? phoneNumber;
  Future<void> getNameOfUser() async {
    DocumentSnapshot profileName = await FirebaseFirestore.instance
        .collection('users')
        .doc('nahom@gmail.com')
        .get();
    DocumentSnapshot userFullProfile = await FirebaseFirestore.instance
        .collection('User Full Profile')
        .doc('0911111111')
        .get();

    // email = profileName['email'];
    phoneNumber = userFullProfile['phone-number'];
    socialMedia = userFullProfile['social-media-link'];
  }

  @override
  void initState() {
    super.initState();
    getNameOfUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.085,
          right: MediaQuery.of(context).size.width * 0.085),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.call_outlined,
              color: CustomColors.blackTextColor,
            ),
            Text(phoneNumber.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.mail,
              color: CustomColors.blackTextColor,
            ),
            Text(email.toString()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.link,
              color: CustomColors.blackTextColor,
            ),
            Text(socialMedia.toString()),
          ],
        ),
      ]),
    );
  }
}
