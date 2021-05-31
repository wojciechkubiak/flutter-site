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
  String body;

  @override
  void initState() {
    super.initState();
    title = widget.project.key;

    img = widget.project.value["img"];
    body = widget.project.value["description"];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isResized = width <= 1600;

    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: isResized ? 20 : 80),
              height: isResized
                  ? width <= 700
                      ? 360
                      : 420
                  : 500,
              width: 800,
              padding: EdgeInsets.only(
                top: isResized ? 100 : 200,
                bottom: isResized ? 0 : 50,
                left: 40,
                right: 40,
              ),
              child: Column(
                mainAxisAlignment: isResized
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                      fontSize: isResized ? 32 : 42,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[600],
                    size: 48,
                  ),
                  CustomRoundButton(
                    text: 'VIEW PROJECT',
                    onTap: () => widget.pickCurrent(widget.project),
                    isActive: true,
                    fontSize: isResized ? 16 : 28,
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
                  EdgeInsets.only(top: isResized ? 10 : 80, left: 5, right: 5),
              padding: img.contains("m") || !isResized
                  ? EdgeInsets.zero
                  : EdgeInsets.only(top: 20),
              child: Image.asset(
                img,
                height: img.contains("m") || !isResized ? 300 : 200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
