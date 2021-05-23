import 'package:flutter/material.dart';

class CustomRoundButton extends StatefulWidget {
  final String text;
  final Function onTap;
  final bool isActive;
  final double fontSize;
  final double width;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isTextBlack;
  final bool isMobileNavbar;
  final bool isDrawer;

  const CustomRoundButton({
    Key key,
    @required this.text,
    @required this.onTap,
    @required this.isActive,
    this.fontSize = 20,
    this.width,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.isTextBlack = false,
    this.isMobileNavbar = false,
    this.isDrawer = false,
  }) : super(key: key);

  @override
  _CustomRoundButtonState createState() => _CustomRoundButtonState();
}

class _CustomRoundButtonState extends State<CustomRoundButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: widget.isActive
                ? hover
                    ? Color(0xFF424242)
                    : Color(0xFF545454)
                : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: new Border.all(
              color: hover && !widget.isActive
                  ? Color(0xFF424242)
                  : Colors.transparent,
              width: 1.0,
            ),
          ),
          width: widget.width,
          margin: widget.margin,
          padding: widget.padding,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
              color: widget.isActive || widget.isMobileNavbar
                  ? Colors.white
                  : Colors.grey[800],
            ),
            textAlign: widget.isDrawer ? TextAlign.start : TextAlign.center,
          ),
        ),
      ),
    );
  }
}
