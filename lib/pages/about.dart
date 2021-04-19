import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/gestures.dart';

import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/home_bloc.dart';

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
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: height < 600 || width < 600 ? 120 : 70,
                          bottom: 20),
                      child: Text(
                        'Find out more',
                        style: TextStyle(
                          fontSize: 62,
                          color: Colors.black87,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 800,
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 40, bottom: 60),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '''In my career I had opportunity to create web and mobile applications, both client and server side. Ok, but how it all started? 
I used to draw a lot in my childhood - and I am doing that until now. Later, in high school I was creating building designs. There was always that one particle inside of me which makes me enjoy creating things. 
After high school fate wanted me to start study programming. Of course the first thing that caught my eye was web and mobile development. From that first weeks - even days - all I'm doing is thinking about what fancy application I could do, that would be nice looking and functional. 
Currently I accept various types of orders, I am working full time job as a programmer - Frontend Developer, which allows me to earn a living while doing something I feel strong with, what makes my eyes shine. 
If you want to hire me or give me an assignment, so I can share my passion with you, fill in the form at the end of the website or just go into one of my social medias and message me. If you want to get to know me better, check out my ''',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black87,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                              children: [
                                TextSpan(
                                  text: 'resume',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => html.window.open(
                                          '/assets/cven.pdf',
                                          'text',
                                        ),
                                ),
                                TextSpan(text: '.')
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          margin: EdgeInsets.only(top: 40, bottom: 40),
                          child: Column(
                            children: [
                              CustomRoundButton(
                                text: 'My technologies',
                                onTap: () => BlocProvider.of<HomeBloc>(context)
                                    .add(HomeTechnologiesShow()),
                                isActive: true,
                                fontSize: 32,
                              ),
                              Visibility(
                                visible: height > 600,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text(
                                    'Check out what my technologies are and what I feel the best with',
                                    style: TextStyle(
                                      fontSize: 42,
                                      height: 1.5,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    BlocProvider.of<HomeBloc>(context)
                                        .add(HomeTechnologiesShow()),
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff262626),
                                  size: 48,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
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
