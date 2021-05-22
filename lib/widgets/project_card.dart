import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'custom_round_button.dart';

class ProjectCard extends StatefulWidget {
  final MapEntry<String, dynamic> project;
  final Function pickCurrent;

  ProjectCard({
    Key key,
    this.project,
    this.pickCurrent,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  String title;
  String img;
  List<String> technologies;
  String body;
  List<String> links;

  @override
  void initState() {
    super.initState();
    title = widget.project.key;

    img = widget.project.value["img"];
    technologies = widget.project.value["technologies"];
    body = widget.project.value["description"];
    links = widget.project.value["links"];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 1200;

    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              height: isMobile
                  ? width <= 700
                      ? 380
                      : 420
                  : 500,
              width: 800,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                top: 200,
                bottom: isMobile ? 0 : 50,
                left: 40,
                right: 40,
              ),
              child: Column(
                mainAxisAlignment: isMobile
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                      fontSize: isMobile ? 32 : 42,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (!isMobile)
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey[400],
                      size: 48,
                    ),
                  CustomRoundButton(
                    text: 'VIEW PROJECT',
                    onTap: () => widget.pickCurrent(widget.project),
                    isActive: true,
                    fontSize: isMobile ? 16 : 28,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: 260,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin:
                  EdgeInsets.only(top: isMobile ? 10 : 80, left: 5, right: 5),
              padding: img.contains("m") || !isMobile
                  ? EdgeInsets.zero
                  : EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: isMobile ? Colors.grey[300] : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(0, 1),
                      color: Colors.black26,
                    )
                  ],
                ),
                child: Image.asset(
                  img,
                  height: img.contains("m") || !isMobile ? 300 : 200,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
