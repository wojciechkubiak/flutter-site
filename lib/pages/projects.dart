import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  List<Map<String, dynamic>> _mobileData = [];
  List<Map<String, dynamic>> _webData = [];

  Map<String, dynamic> _currentMobileProject = {};
  Map<String, dynamic> _currentWebProject = {};

  double opacity = 0;
  bool isNavbarAboveText = false;
  bool isSwitched = false;

  CarouselController buttonCarouselController = CarouselController();

  @override
  initState() {
    super.initState();
    _mobileData = widget.projects["mobile"];
    _currentMobileProject = widget.projects["mobile"].first;
    _webData = widget.projects["web"];
    _currentWebProject = widget.projects["web"].first;

    Future.delayed(Duration(seconds: 1), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: ScreenTypeLayout(
        mobile: _body(scale: 0.1),
        tablet: _body(scale: 0.07),
        desktop: _body(scale: 0.05),
      ),
      activePage: ActivePage.PROJECTS,
      isNavbarAboveText: isNavbarAboveText,
    );
  }

  Widget _body({double scale}) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: 60,
        bottom: 32,
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            padding: EdgeInsets.only(
              top: scale == 0.1 ? 72 : 0,
              bottom: 64,
            ),
            child: Column(
              children: [
                VisibilityDetector(
                  key: Key('projects-header'),
                  onVisibilityChanged: (visibilityInfo) {
                    var visiblePercentage =
                        visibilityInfo.visibleFraction * 100;
                    setState(() => isNavbarAboveText = visiblePercentage < 100);
                  },
                  child: Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 72 * (1 - scale * 6),
                      color: Colors.grey[800],
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: scale > 0.07 ? TextAlign.center : TextAlign.left,
                  ),
                ),
                _modeSwitch(),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'swipe for more',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (!isSwitched)
                  _carousel(data: _mobileData, isMobile: true, scale: scale)
                else
                  _carousel(data: _webData, isMobile: false, scale: scale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _modeSwitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 42.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
            text: 'Mobile',
            onPressed: () => setState(() => isSwitched = false),
            isActive: !isSwitched,
            width: 112,
          ),
          CustomToggle(
            isActive: isSwitched,
            onTap: () => setState(
              () => isSwitched = !isSwitched,
            ),
          ),
          CustomTextButton(
            text: 'Web',
            onPressed: () => setState(() => isSwitched = true),
            isActive: isSwitched,
            width: 112,
          ),
        ],
      ),
    );
  }

  Widget _carousel({
    List<Map<String, dynamic>> data,
    bool isMobile,
    double scale,
  }) {
    CarouselController buttonCarouselController = CarouselController();

    double multiplier = 1 + (1 - scale * 10);

    return Container(
      padding: const EdgeInsets.only(top: 42.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: isMobile ? 920 : 720,
          viewportFraction: isMobile ? 0.9 : 1,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
          onPageChanged: (value, _) => setState(
            () => !isMobile
                ? _currentWebProject = data[value]
                : _currentMobileProject = data[value],
          ),
        ),
        carouselController: buttonCarouselController,
        items: data.map((value) {
          return Builder(
            builder: (BuildContext context) {
              return _card(
                img: value["img"],
                title: value["title"],
                description: value["description"],
                links: value["links"],
                imgWidth: !isMobile ? 420 * multiplier : 180 * multiplier,
                scale: scale,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _card({
    String img,
    String title,
    String description,
    double scale,
    Map<String, dynamic> links,
    double imgWidth = 200,
  }) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: [
        RepaintBoundary(
          child: Image.asset(
            img,
            width: imgWidth,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 32),
          width: 320,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Colors.grey[800],
                  fontSize: 52 * (1 - scale * 4),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.grey[700],
                    fontSize: 24,
                  ),
                ),
              ),
              _linkImages(links: links),
            ],
          ),
        ),
      ],
    );
  }

  Widget _linkImages({Map<String, dynamic> links, double width = 120}) {
    void goTo(url) async => await launch(url);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: links.entries.map((element) {
          return GestureDetector(
            onTap: () => goTo(element.value["url"]),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    RepaintBoundary(
                      child: Image.asset(
                        element.value["img"],
                        width: width,
                      ),
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
}
