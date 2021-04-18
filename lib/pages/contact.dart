import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
          Navbar(activePage: ActivePage.CONTACT)
        ],
      ),
    );
  }
}
