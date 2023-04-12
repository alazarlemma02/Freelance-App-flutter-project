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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 234 / 2,
          height: 87 / 2,
          image: AssetImage('assets/images/Logo(1X).png'),
        ),
      ],
    );
  }
}
