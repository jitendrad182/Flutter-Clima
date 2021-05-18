import 'package:flutter/material.dart';

class ReusableExpanded extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  ReusableExpanded({@required this.text, @required this.fontSize, this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF1D1E33),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: fontSize, color: color),
          ),
        ),
      ),
    );
  }
}
