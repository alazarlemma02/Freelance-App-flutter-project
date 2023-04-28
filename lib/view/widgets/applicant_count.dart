import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';

class ApplicantCountWidget extends StatelessWidget {
  final int applicantCount;
  const ApplicantCountWidget({
    super.key,
    required this.applicantCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.buttonBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: CustomColors.backgroundColor,
            size: 20,
          ),
          Text(
            '$applicantCount',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 12,
              color: CustomColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
