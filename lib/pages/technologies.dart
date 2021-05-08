import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'page_builder.dart';

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
      "background": "assets/flutter.jpg",
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
      "background": "assets/react.jpg",
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
      "background": "assets/node.jpg",
      "description": ["Basics of ExpressJS", "REST API", "MVC", "Sequelize"]
    },
    "JavaScript": {
      "icon": "assets/javascript.png",
      "background": "assets/javascript.jpg",
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
      "background": "assets/python.jpg",
      "description": [
        "Basic syntax",
        "Basic functionalities",
        "Simple web apps implementation"
      ]
    },
    "SQL": {
      "icon": "assets/sql.png",
      "background": "assets/sql.jpg",
      "description": ["Advanced syntax", "T-SQL"]
    },
    "HTML": {
      "icon": "assets/html.png",
      "background": "assets/html.jpg",
      "description": ["Semi-advanced syntax"]
    },
    "CSS": {
      "icon": "assets/css.png",
      "background": "assets/css.jpg",
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
        color: Colors.white,
      ),
      activePage: ActivePage.TECHNOLOGIES,
    );
  }

  Widget _body() {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment:
          width < 600 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: width < 600 ? 0 : 64, top: 100, bottom: 20),
          child: Text(
            'My skills',
            style: TextStyle(
              fontSize: 72,
              color: Colors.orangeAccent,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width < 600 ? 0 : 64, bottom: 20),
          child: Text(
            'Check out my strengths',
            style: TextStyle(
              fontSize: 42,
              height: 1.5,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 3),
            color: Colors.black45,
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4 - 80,
                constraints: BoxConstraints(minWidth: 400),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //   Colors.orangeAccent.withOpacity(0.7),
                    //   BlendMode.color,
                    // ),
                    image: ExactAssetImage(background),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
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
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    for (var item in body)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          item,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black87,
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
            top: 164,
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
