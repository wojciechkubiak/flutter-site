import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/widgets.dart';
import './../models/models.dart';
import 'page_builder.dart';

class Projects extends StatefulWidget {
  final Map<String, dynamic> projects;
  const Projects({Key key, this.projects}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  double opacity = 0;
  bool isProjectInfoShown = false;
  MapEntry<String, dynamic> currentProject;
  Map<String, dynamic> _projects;

  @override
  initState() {
    super.initState();
    _projects = widget.projects;
    Future.delayed(Duration(seconds: 1), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(),
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
                        if (!isMobile)
                          _linkImages(currentProject.value["links"],
                              isMobile ? 110 : 160)
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 64),
                            child: Column(children: [
                              _mobileLinkButtons(currentProject.value["links"]),
                              CustomRoundButton(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                text: 'Back',
                                width: 260,
                                onTap: () =>
                                    setState(() => isProjectInfoShown = false),
                                isActive: false,
                                fontSize: 26,
                              ),
                            ]),
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
              items: _projects.entries.map((entry) {
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

  Widget _linkImages(Map<String, dynamic> links, double width) {
    void goTo(url) async => await launch(url);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: links.entries.map((element) {
          return GestureDetector(
            onTap: () => goTo(element.value["url"]),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    Image.asset(
                      element.value["img"],
                      width: width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        element.key,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList());
  }

  Widget _mobileLinkButtons(Map<String, dynamic> links) {
    void goTo(url) async => await launch(url);

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: links.entries.map((element) {
          return CustomRoundButton(
            margin: EdgeInsets.symmetric(vertical: 4),
            text: element.key,
            width: 260,
            onTap: () => goTo(element.value["url"]),
            isActive: true,
            fontSize: 26,
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
