import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/view/widgets/field_validator.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage(
      {super.key,
      required this.hint_text,
      required this.field_icon,
      required this.field_height,
      required this.editingController,
      required this.maximumLines});
  final String hint_text;
  final IconData field_icon;
  final double field_height;
  final int maximumLines;
  final TextEditingController editingController;
  String getHintText() {
    return hint_text;
  }

  double getFieldHeight() {
    return field_height;
  }

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.editingController,
      maxLines: widget.maximumLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * widget.field_height),
        suffixIcon: Icon(size: 20, this.widget.field_icon),
        hintText: '${widget.hint_text}'.tr().toString(),
        labelStyle: const TextStyle(
          color: CustomColors.blackTextColor,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: CustomColors.blackTextColor,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 12,
        color: CustomColors.fadedTextColor,
      ),
      validator: (value) => Validator.validateProfileField(
          fieldData: widget.editingController.text),
    );
  }
}
