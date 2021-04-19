import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import '../bloc/home/home_bloc.dart';

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
    Future.delayed(Duration(milliseconds: 200), () {
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
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 1),
            child: Center(
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
                        fontFamily: 'Disciplina',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Developer",
                      style: TextStyle(
                        fontSize: 64,
                        fontFamily: 'Raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomRoundButton(
                      text: 'Find out more',
                      onTap: () => BlocProvider.of<HomeBloc>(context)
                          .add(HomeAboutShow()),
                      isActive: true,
                      fontSize: 28,
                      margin: const EdgeInsets.symmetric(vertical: 24),
                    ),
                    IconButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context)
                          .add(HomeAboutShow()),
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
          ),
          Navbar(activePage: ActivePage.LANDING, isTransparent: true)
        ],
      ),
    );
  }
}
