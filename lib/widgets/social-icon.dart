import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  SocialIcon({Key key, @required this.icon, @required this.url})
      : super(key: key);

  @override
  _SocialIconState createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool hover = false;

  void goTo() async => await launch(widget.url);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => goTo(),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.symmetric(horizontal: width > 600 ? 12 : 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: hover ? Colors.grey[900] : Colors.grey[800],
                  width: 3.0,
                ),
              ),
              child: Center(
                  child: FaIcon(
                widget.icon,
                color: hover ? Colors.grey[900] : Colors.grey[800],
                size: 32,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
