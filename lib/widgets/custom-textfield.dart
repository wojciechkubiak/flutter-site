import 'package:flutter/material.dart';

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
        cursorColor: Colors.orange,
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
          color: isTransparent ? Colors.black87 : Colors.white54,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: isTransparent ? Colors.black26 : Colors.white24,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          hintText: hint,
          hintStyle:
              TextStyle(color: isTransparent ? Colors.black45 : Colors.white24),
        ),
      ),
    );
  }
}
