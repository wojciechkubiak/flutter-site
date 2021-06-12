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
    bool isMobile = MediaQuery.of(context).size.width <= 700;

    return Container(
      height: isMobile ? 400 : 750,
      child: Column(
        mainAxisAlignment: isResized
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            height: 326,
            width: 574,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
