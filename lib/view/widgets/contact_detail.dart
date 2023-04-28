import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class ContactDetail extends StatefulWidget {
  String? email;
  String? socialMedia;
  String? phoneNumber;
  ContactDetail(
      {super.key,
      required this.email,
      required this.socialMedia,
      required this.phoneNumber});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
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
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Icon(
                  Icons.call_outlined,
                  color: CustomColors.blackTextColor,
                ),
                Icon(
                  Icons.mail,
                  color: CustomColors.blackTextColor,
                ),
                Icon(
                  Icons.link,
                  color: CustomColors.blackTextColor,
                ),
              ]),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.phoneNumber.toString()),
                      Text(widget.email.toString()),
                      Text(widget.socialMedia.toString())
                    ],
                  ),
                ],
              )
            ],
          ),
        ]),
      ]),
    );
  }
}
