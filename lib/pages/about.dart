import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  double opacity = 0;

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/bg1.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),

      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 1),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ),
          Navbar(activePage: ActivePage.ABOUT)
        ],
      ),
    );
  }
}
