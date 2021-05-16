import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/widgets.dart';
import 'page_builder.dart';
import './../models/models.dart';

class Technologies extends StatefulWidget {
  const Technologies({Key key}) : super(key: key);

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  double opacity = 0;

  Map<String, dynamic> skills = {
    "Flutter": {
      "icon": "assets/flutter.png",
      "background": "assets/flutter.webp",
      "description": [
        "Objective programming",
        "Making of views and app logic",
        "BLoC architecture",
        "Implementation and modification of existing packages",
        "Animations"
      ]
    },
    "ReactJS": {
      "icon": "assets/react.png",
      "background": "assets/react.webp",
      "description": [
        "React Hooks",
        "Functional programming",
        "Objective programming",
        "External libraries implementation",
        "Basics of Redux"
      ]
    },
    "NodeJS": {
      "icon": "assets/node.png",
      "background": "assets/node.webp",
      "description": ["Basics of ExpressJS", "REST API", "MVC", "Sequelize"]
    },
    "JavaScript": {
      "icon": "assets/javascript.png",
      "background": "assets/javascript.webp",
      "description": [
        "ES6+",
        "DOM Manipulation",
        "Functional programming",
        "Objective programming",
        "Async",
        "Basics of TypeScript"
      ]
    },
    "Python": {
      "icon": "assets/python.png",
      "background": "assets/python.webp",
      "description": [
        "Basic syntax",
        "Basic functionalities",
        "Simple web apps implementation"
      ]
    },
    "SQL": {
      "icon": "assets/sql.png",
      "background": "assets/sql.webp",
      "description": ["Advanced syntax", "T-SQL"]
    },
    "HTML": {
      "icon": "assets/html.png",
      "background": "assets/html.webp",
      "description": ["Semi-advanced syntax"]
    },
    "CSS": {
      "icon": "assets/css.png",
      "background": "assets/css.webp",
      "description": ["CSS Grid", "Flexbox", "SASS", "Animations"]
    },
  };

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      activePage: ActivePage.TECHNOLOGIES,
    );
  }

  Widget _body() {
    double width = MediaQuery.of(context).size.width;
    bool isHDRady = width <= 1600;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width < 600 ? 16 : 64,
              right: width < 600 ? 16 : 64,
              top: 80,
              bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'My skills',
                style: TextStyle(
                  fontSize: !isHDRady ? 72 : 56,
                  color: Colors.grey[800],
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Check out my strengths',
                style: TextStyle(
                  fontSize: 42,
                  height: 1.5,
                  color: Colors.grey[700],
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Center(
          child: Wrap(
            children: [
              ...skills.entries.map((entry) {
                return _card(
                    header: entry.key,
                    body: entry.value["description"],
                    icon: entry.value["icon"],
                    background: entry.value["background"]);
              }).toList(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 64, top: 60, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'including Git, Linux, Windows and Jira',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ],
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      width: MediaQuery.of(context).size.width / 4 - 80,
      constraints: BoxConstraints(minWidth: 400),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4 - 80,
                constraints: BoxConstraints(minWidth: 400),
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Color(0xFF666666),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        header,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.black87,
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
                            color: Colors.white,
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
