import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Technologies extends StatefulWidget {
  const Technologies({Key key}) : super(key: key);

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
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
      decoration: BoxDecoration(color: Colors.white),
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
          Navbar(activePage: ActivePage.TECHNOLOGIES)
        ],
      ),
    );
  }
}
