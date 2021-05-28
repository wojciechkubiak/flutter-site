import 'package:flutter/material.dart';
import 'package:mysite/config/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isTransparent;
  final Function onSubmitted;
  final Function onChange;
  final Function onEditingComplete;

  const CustomTextfield({
    Key key,
    this.isTransparent = false,
    this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.onChange,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: TextField(
        cursorColor: Color(0xFFD16758),
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        onChanged: onChange,
        onEditingComplete: onEditingComplete,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[800], width: 2),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[800], width: 2),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black45),
        ),
      ),
    );
  }
}
