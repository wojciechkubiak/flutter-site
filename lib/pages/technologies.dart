import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/bloc/home/home_bloc.dart';
import 'package:mysite/config/colors.dart';
import 'package:mysite/widgets/custom_round_button.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'page_builder.dart';

import './../models/models.dart';

class Technologies extends StatefulWidget {
  final Map<String, dynamic> technologies;
  Technologies({Key key, this.technologies}) : super(key: key);

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  CarouselController buttonCarouselController = CarouselController();
  double opacity = 0;
  Map<String, dynamic> _skills;
  bool isNavbarAboveText = false;

  @override
  initState() {
    super.initState();
    _skills = widget.technologies;
    Future.delayed(Duration(seconds: 1), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(),
      activePage: ActivePage.TECHNOLOGIES,
      isNavbarAboveText: isNavbarAboveText,
    );
  }

  Widget _body() {
    double width = MediaQuery.of(context).size.width;
    bool isHDRady = width <= 1200;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width < 600 ? 16 : 64,
            right: width < 600 ? 16 : 64,
            top: 80,
            bottom: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VisibilityDetector(
                key: Key('technologies-header'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  setState(() => isNavbarAboveText = visiblePercentage < 100);
                },
                child: Text(
                  'My skills',
                  style: TextStyle(
                    fontSize: !isHDRady ? 72 : 56,
                    color: Colors.grey[800],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: width < 600 ? TextAlign.center : TextAlign.left,
                ),
              ),
              if (width > 700)
                Text(
                  'Check out my strengths',
                  style: TextStyle(
                    fontSize: 42,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: width < 600 ? TextAlign.center : TextAlign.left,
                ),
            ],
          ),
        ),
        Center(
          child: Wrap(
            children: [
              ..._skills.entries.map((entry) {
                return _card(
                    header: entry.key,
                    body: entry.value["description"],
                    icon: entry.value["icon"],
                    background: entry.value["background"]);
              }).toList(),
            ],
          ),
        ),
        if (width > 700)
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'including Git, Linux, Windows and Jira',
                  style: TextStyle(
                    fontSize: width < 600 ? 18 : 24,
                    color: Colors.grey[800],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'Find out what can I do with them',
            style: TextStyle(
              fontSize: isHDRady ? 32 : 42,
              height: 1.5,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        CustomRoundButton(
          margin: EdgeInsets.symmetric(vertical: 20),
          text: 'My projects',
          width: 260,
          onTap: () =>
              BlocProvider.of<HomeBloc>(context).add(HomeProjectsShow()),
          isActive: true,
          fontSize: isHDRady ? 26 : 32,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: IconButton(
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeProjectsShow()),
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.grey[800],
              size: 48,
            ),
          ),
        ),
      ],
    );
  }

  Widget _card({
    String header,
    List<String> body,
    String icon,
    String background,
  }) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 700;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: isMobile ? 8 : 40),
      width: width / 4 - 80,
      constraints: BoxConstraints(minWidth: 400),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width / 4 - 80,
                constraints: BoxConstraints(minWidth: 400),
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 180),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        header,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    for (var item in body)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Image.asset(
              icon,
              width: 72,
              height: 72,
            ),
          ),
        ],
      ),
    );
  }
}
