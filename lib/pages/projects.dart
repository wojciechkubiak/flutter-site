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

  Map<String, dynamic> projects = {
    "Energe": {
      "img": "assets/1w.png",
      "technologies": ['assets/react.png', 'assets/node.png'],
      "description":
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
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
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Obb-sys": {
      "img": "assets/2m.png",
      "technologies": ['assets/react.png', 'assets/node.png', 'assets/sql.png'],
      "description":
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
      "links": [
        'assets/apple.png',
        'assets/google.png',
      ]
    },
    "Opqn-web": {
      "img": "assets/3w.png",
      "technologies": ['assets/react.png', 'assets/node.png', 'assets/sql.png'],
      "description":
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
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
          'Project that supports user wellbeing through multiple exercises and by creating statistics that can be later used by user.',
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
        Container(
          padding: EdgeInsets.only(top: isMobile ? 80 : 0),
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
                height: isMobile ? 600 : 800,
                viewportFraction: isMobile ? 0.7 : 0.3),
            carouselController: buttonCarouselController,
            items: projects.entries.map((entry) {
              return Builder(
                builder: (BuildContext context) {
                  return ProjectCard(
                    title: entry.key,
                    img: entry.value["img"],
                    technologies: entry.value["technologies"],
                    body: entry.value["description"],
                    links: entry.value["links"],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
