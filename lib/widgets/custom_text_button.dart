import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isActive;
  final double width;

  const CustomTextButton({
    Key key,
    this.text,
    this.onPressed,
    this.isActive,
    this.width = 92,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: isActive ? Color(0xFFD16758) : Colors.grey[800],
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
