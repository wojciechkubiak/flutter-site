import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import './../models/models.dart';
import 'page_builder.dart';

class Projects extends StatefulWidget {
  const Projects({Key key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double opacity = 0;
  bool isProjectInfoShown = false;
  MapEntry<String, dynamic> currentProject;

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
      activePage: ActivePage.PROJECTS,
    );
  }

  CarouselController buttonCarouselController = CarouselController();

  void pickCurrent(MapEntry<String, dynamic> project) {
    setState(() {
      currentProject = project;
      isProjectInfoShown = true;
    });
  }

  Map<String, dynamic> projects = {
    "Energe": {
      "img": "assets/1w.png",
      "technologies": ['assets/react.png', 'assets/node.png'],
      "description":
          'Website for dutch renovating company created. It takes clients data, counts new usage values and sends them to the company through ZOHO CRM.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Meditate": {
      "img": "assets/1m.png",
      "technologies": ['assets/flutter.png'],
      "description":
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Opqn": {
      "img": "assets/2w.png",
      "technologies": ['assets/java.png', 'assets/node.png', 'assets/sql.png'],
      "description":
          'Study project that allows user to share health data with dietitians.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Obb-sys": {
      "img": "assets/2m.png",
      "technologies": ['assets/react.png', 'assets/node.png', 'assets/sql.png'],
      "description":
          'My engineering project for Centre of Biomedical Research. It allows user to collect data and statistics that later shows if there are any symptoms of being sick, of animal.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Opqn-web": {
      "img": "assets/3w.png",
      "technologies": ['assets/react.png', 'assets/node.png', 'assets/sql.png'],
      "description":
          'Easy project that allows user to share health data with dietitians.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Animacare": {
      "img": "assets/3m.png",
      "technologies": [
        'assets/flutter.png',
        'assets/node.png',
        'assets/sql.png'
      ],
      "description":
          'My own project I\'m currently working on. Application for people that love their animals and want to compare them with other users, track their data and more.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
  };

  Widget _body() {
    bool isMobile = MediaQuery.of(context).size.width <= 700;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isProjectInfoShown)
          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            constraints: BoxConstraints(minHeight: 700),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (currentProject != null)
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal:
                          currentProject.value["img"].contains("m") && !isMobile
                              ? 112
                              : 12,
                    ),
                    width: 450,
                    constraints: BoxConstraints(
                      minHeight: 600,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (!isMobile)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isProjectInfoShown = false),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.grey[800],
                                size: 42,
                              ),
                            ),
                          ),
                        Text(
                          currentProject.key,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.grey[800],
                            fontSize: 52,
                          ),
                        ),
                        if (isMobile)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  currentProject.value["img"].contains("m")
                                      ? 24
                                      : 0,
                            ),
                            child: Image.asset(
                              currentProject.value["img"],
                              height: currentProject.value["img"].contains("m")
                                  ? 450
                                  : 300,
                            ),
                          ),
                        _technologyImage(
                          currentProject.value["technologies"],
                          isMobile ? 48 : 75,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 24, horizontal: isMobile ? 24 : 0),
                          child: Text(
                            currentProject.value["description"],
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.grey[700],
                              fontSize: 24,
                            ),
                          ),
                        ),
                        _linkImage(currentProject.value["links"],
                            isMobile ? 110 : 160),
                        if (isMobile)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(top: 24),
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => isProjectInfoShown = false),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 42,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                if (!isMobile)
                  Image.asset(currentProject.value["img"], height: 450),
              ],
            ),
          )
        else
          Container(
            padding: EdgeInsets.only(top: 80),
            width: double.infinity,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.width <= 1200 ? 600 : 800,
                  viewportFraction: isMobile ? 0.7 : 0.3),
              carouselController: buttonCarouselController,
              items: projects.entries.map((entry) {
                return Builder(
                  builder: (BuildContext context) {
                    return ProjectCard(
                      project: entry,
                      pickCurrent: pickCurrent,
                    );
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _linkImage(List<String> links, double width) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: links.map((element) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Image.asset(
                element,
                width: width,
              ),
            ),
          );
        }).toList());
  }

  Widget _technologyImage(List<String> technologies, double width) {
    return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: technologies.map((element) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Image.asset(
              element,
              width: width,
            ),
          );
        }).toList());
  }
}
