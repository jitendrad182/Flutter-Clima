import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final Function onChanged;
  final Icon prefixIcon;
  final String hintText;

  ReusableTextFormField({
    @required this.hintText,
    @required this.prefixIcon,
    @required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontWeight: FontWeight.bold),
      onChanged: onChanged,
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
