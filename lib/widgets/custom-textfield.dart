import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  final bool isTransparent;

  const CustomTextfield(
      {Key key,
      this.isTransparent = false,
      this.hint,
      this.maxLines = 1,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: TextField(
        cursorColor: Colors.orange,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        textInputAction: TextInputAction.done,
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
