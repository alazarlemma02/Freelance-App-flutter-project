import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'language_dropdown_selection.dart';

class SiraLogo extends StatefulWidget {
  const SiraLogo({super.key});

  @override
  State<SiraLogo> createState() => _SiraLogoState();
}

class _SiraLogoState extends State<SiraLogo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.20,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Image(
            image: AssetImage('assets/images/Logo(1X).png'),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.20,
          child: SelectLanguage(),
        ),
      ],
    );
  }
}
