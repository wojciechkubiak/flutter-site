import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isActive;
  final double fontSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isTextBlack;

  const CustomRoundButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.isActive,
    this.fontSize = 20,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.isTextBlack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF388E3C) : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        margin: margin,
        padding: padding,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
            color: isTextBlack ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}
