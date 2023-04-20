import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/sira_logo.dart';

String? categoryGroup;

class Category_page extends StatefulWidget {
  const Category_page({super.key});

  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: const SiraLogo(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    'I-specialize-in'.tr().toString(),
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: CustomColors.blackTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    'Pick-one'.tr().toString(),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CustomColors.fadedTextColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CategoryCard(
                        categoryName: "Finance",
                      ),
                      Radio(
                          value: "Finance",
                          groupValue: categoryGroup,
                          onChanged: (value) {
                            setState(() {
                              categoryGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                  Stack(
                    children: [
                      CategoryCard(
                        categoryName: "Design & Creativity",
                      ),
                      Radio(
                          value: "Design & Creativity",
                          groupValue: categoryGroup,
                          onChanged: (value) {
                            setState(() {
                              categoryGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                  Stack(
                    children: [
                      CategoryCard(
                        categoryName: "Engineering & Architecture",
                      ),
                      Radio(
                          value: "Engineering & Architecture",
                          groupValue: categoryGroup,
                          onChanged: (value) {
                            setState(() {
                              categoryGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                  Stack(
                    children: [
                      CategoryCard(
                        categoryName: "Writing",
                      ),
                      Radio(
                          value: "Writing",
                          groupValue: categoryGroup,
                          onChanged: (value) {
                            setState(() {
                              categoryGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                  Stack(
                    children: [
                      CategoryCard(
                        categoryName: "Web, Mobile & Software Development",
                      ),
                      Radio(
                          value: "Web, Mobile & Software Development",
                          groupValue: categoryGroup,
                          onChanged: (value) {
                            setState(() {
                              categoryGroup = value.toString();
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    40,
                  ),
                  backgroundColor: CustomColors.buttonBlueColor),
              onPressed: () {
                Navigator.pushNamed(context, '/SignUpPage');
              },
              child: Text(
                'continue'.tr().toString(),
                style: const TextStyle(
                  color: CustomColors.backgroundColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  String categoryName;
  CategoryCard({
    super.key,
    required this.categoryName,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // border: Border.all(color: CustomColors.blackTextColor),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: CustomColors.cardColor,
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                '${widget.categoryName}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColors.blackTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
