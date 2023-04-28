import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';

class JobDetailCard extends StatelessWidget {
  final String priceLimit;
  final String applicaitionDeadline;
  final String category;
  final String desctiption;

  const JobDetailCard({
    super.key,
    required this.priceLimit,
    required this.applicaitionDeadline,
    required this.category,
    required this.desctiption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: CustomColors.cardColor,
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Price Limit",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${priceLimit}',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                        color: CustomColors.goldenColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Application Deadline",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '${applicaitionDeadline}',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12,
                          color: CustomColors.buttonBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.blackTextColor),
                    color: CustomColors.backgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${category}',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: Text(
              '${desctiption}',
            ),
          ),
        ],
      ),
    );
  }
}
