import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class AttachmentFile extends StatefulWidget {
  const AttachmentFile({super.key});

  @override
  State<AttachmentFile> createState() => _AttachmentFileState();
}

class _AttachmentFileState extends State<AttachmentFile> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.height * 0.1,
            child: IconButton(
                iconSize: 50,
                onPressed: () {
                  print("pressed button 1");
                },
                icon: Icon(
                  Icons.download,
                  color: CustomColors.blackTextColor,
                  size: MediaQuery.of(context).size.height * 0.03,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Attachment 1',
              style:
                  TextStyle(color: CustomColors.blackTextColor, fontSize: 10),
            ),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.height * 0.1,
            child: IconButton(
                iconSize: 50,
                onPressed: () {
                  print("pressed button 2");
                },
                icon: Icon(
                  Icons.download,
                  color: CustomColors.blackTextColor,
                  size: MediaQuery.of(context).size.height * 0.03,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Attachment 2',
              style:
                  TextStyle(color: CustomColors.blackTextColor, fontSize: 10),
            ),
          )
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.height * 0.1,
            child: IconButton(
                iconSize: 50,
                onPressed: () {
                  print("pressed button 3");
                },
                icon: Icon(
                  Icons.download,
                  color: CustomColors.blackTextColor,
                  size: MediaQuery.of(context).size.height * 0.03,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Attachment 3',
              style:
                  TextStyle(color: CustomColors.blackTextColor, fontSize: 10),
            ),
          )
        ],
      ),
    ]);
  }
}
