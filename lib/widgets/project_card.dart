import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import 'custom_round_button.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String img;
  final List<String> technologies;
  final String body;
  final List<String> links;

  ProjectCard({
    Key key,
    this.title,
    this.img,
    this.technologies,
    this.body,
    this.links,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
                    widget.title,
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
                    onTap: () {},
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
                  EdgeInsets.only(top: isMobile ? 40 : 80, left: 5, right: 5),
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
                  widget.img,
                  height: 300,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _linkImage(List<String> links, double width) {
    return Column(
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
