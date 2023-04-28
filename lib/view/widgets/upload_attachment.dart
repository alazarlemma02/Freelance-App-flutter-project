import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';

class UploadAttachment extends StatefulWidget {
  final Function setAttachment;
  const UploadAttachment({super.key, required this.setAttachment});

  @override
  State<UploadAttachment> createState() => _UploadAttachmentState();
}

class _UploadAttachmentState extends State<UploadAttachment> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.setAttachment();
              },
              style: ElevatedButton.styleFrom(
                shadowColor: CustomColors.blackTextColor,
                fixedSize: const Size(100, 90),
                backgroundColor: CustomColors.backgroundColor,
              ),
              child: Icon(
                Icons.upload_outlined,
                size: MediaQuery.of(context).size.height * 0.05,
                color: CustomColors.blackTextColor,
              ),
            ),
            Text(
              'upload-document'.tr().toString(),
              style:
                  TextStyle(color: CustomColors.blackTextColor, fontSize: 10),
            )
          ],
        ),
      ),
      flex: 10,
    );
  }
}
