import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteLogo extends StatefulWidget {
  WebsiteLogo({Key key}) : super(key: key);

  @override
  _WebsiteLogoState createState() => _WebsiteLogoState();
}

class _WebsiteLogoState extends State<WebsiteLogo> {
  bool hover = false;

  void goTo() async {
    const url = 'https://wojciechkubiak.com';
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: () => goTo(),
        child: Row(
          children: [
            Image.asset(
              'assets/WK.png',
              height: 70,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(left: hover ? 24 : 0),
              child: AnimatedOpacity(
                opacity: hover ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Text(
                  'Your dev',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Color(0xFF262626),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
