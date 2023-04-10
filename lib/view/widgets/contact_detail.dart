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
            Text('+251 933 452 323'),
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
            Text('person@gmail.com'),
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
            Text('www.person-site.com'),
          ],
        ),
      ]),
    );
  }
}
