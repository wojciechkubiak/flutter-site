import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Landing extends StatefulWidget {
  const Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 1),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wojciech Kubiak",
                      style: TextStyle(
                        fontSize: 112,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Developer",
                      style: TextStyle(fontSize: 64),
                      textAlign: TextAlign.center,
                    ),
                    CustomRoundButton(
                      text: 'Dowiedz się więcej',
                      onTap: () {},
                      isActive: true,
                      fontSize: 28,
                      margin: const EdgeInsets.symmetric(vertical: 24),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black87,
                        size: 48,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Navbar(
              activePage: ActivePage.LANDING,
            )
          ],
        ),
      ),
    );
  }
}
