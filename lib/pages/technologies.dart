import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/bloc/home/home_bloc.dart';
import 'package:mysite/widgets/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'page_builder.dart';

import './../models/models.dart';

class Technologies extends StatefulWidget {
  final List<Map<String, dynamic>> technologies;
  final List<Map<String, dynamic>> order;

  Technologies({Key key, this.technologies, this.order}) : super(key: key);

  @override
  _TechnologiesState createState() => _TechnologiesState();
}

class _TechnologiesState extends State<Technologies> {
  CarouselController buttonCarouselController = CarouselController();
  List<Map<String, dynamic>> _skillsData = [];
  List<Map<String, dynamic>> _orderData = [];

  Map<String, dynamic> _currentSkill = {};
  Map<String, dynamic> _currentOrder = {};

  bool isSwitched = false;
  bool isNavbarAboveText = false;

  double opacity = 0;

  @override
  initState() {
    super.initState();
    _skillsData = widget.technologies;
    _currentSkill = widget.technologies.first;
    _orderData = widget.order;
    _currentOrder = widget.order.first;
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
      activePage: ActivePage.TECHNOLOGIES,
      isNavbarAboveText: isNavbarAboveText,
    );
  }

  Widget _body({double scale}) {
    double width = MediaQuery.of(context).size.width;
    bool isHDRady = width <= 1200;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.1,
            right: width * 0.1,
            top: 80,
            bottom: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VisibilityDetector(
                key: Key('technologies-header'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  setState(() => isNavbarAboveText = visiblePercentage < 100);
                },
                child: Text(
                  'My skills',
                  style: TextStyle(
                    fontSize: !isHDRady ? 72 : 56,
                    color: Colors.grey[800],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: width < 600 ? TextAlign.center : TextAlign.left,
                ),
              ),
              if (width > 700)
                Text(
                  'Check out my strengths',
                  style: TextStyle(
                    fontSize: 42,
                    height: 1.5,
                    color: Colors.grey[600],
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: width < 600 ? TextAlign.center : TextAlign.left,
                ),
              _modeSwitch(),
              if (!isSwitched) _hire(scale: scale) else _order(scale: scale),
              if (width > 700)
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'including Git, Linux, Windows and Jira',
                        style: TextStyle(
                          fontSize: width < 600 ? 18 : 24,
                          color: Colors.grey[800],
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'Find out what can I do with them',
                      style: TextStyle(
                        fontSize: isHDRady ? 32 : 42,
                        height: 1.5,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CustomRoundButton(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    text: 'My projects',
                    width: 260,
                    onTap: () => BlocProvider.of<HomeBloc>(context)
                        .add(HomeProjectsShow()),
                    isActive: true,
                    fontSize: isHDRady ? 26 : 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: IconButton(
                      onPressed: () => BlocProvider.of<HomeBloc>(context)
                          .add(HomeProjectsShow()),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey[800],
                        size: 48,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _modeSwitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 42.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextButton(
            text: 'Hire',
            onPressed: () => setState(() => isSwitched = false),
            isActive: !isSwitched,
          ),
          CustomToggle(
            isActive: isSwitched,
            onTap: () => setState(
              () => isSwitched = !isSwitched,
            ),
          ),
          CustomTextButton(
            text: 'Order',
            onPressed: () => setState(() => isSwitched = true),
            isActive: isSwitched,
          ),
        ],
      ),
    );
  }

  Widget _hire({double scale}) {
    if (scale >= 0.07) {
      return Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 460),
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: descriptionContainer(
              image: _currentSkill["icon"],
              title: _currentSkill["title"],
              descriptionList: _currentSkill["description"],
            ),
          ),
          _picker(data: _skillsData),
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
          )
        ],
      );
    }

    return _webSkillsContainer(data: _skillsData, isOrder: false, scale: scale);
  }

  Widget _order({double scale}) {
    if (scale >= 0.07) {
      return Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: 460),
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: descriptionContainer(
              image: _currentOrder["icon"],
              title: _currentOrder["title"],
              descriptionText: _currentOrder["description"],
              isOrder: true,
            ),
          ),
          _picker(data: _orderData, isOrder: true),
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
          )
        ],
      );
    }

    return _webSkillsContainer(data: _orderData, isOrder: true, scale: scale);
  }

  Widget _webSkillsContainer({
    List<Map<String, dynamic>> data,
    bool isOrder,
    double scale,
  }) {
    double width = MediaQuery.of(context).size.width;

    double skillsScale = scale == 0.07 ? 0.5 : 0.3;
    double descriptionScale = scale == 0.07 ? 0.5 : 0.3;

    double constraintBasicSize = 420 * (1 + (1 - (scale * 10)));

    return Container(
      padding: EdgeInsets.symmetric(vertical: 64),
      constraints: BoxConstraints(minHeight: constraintBasicSize),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          Container(
            width: width * skillsScale,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: [
                ...data.map((element) {
                  bool isActive = isOrder
                      ? element["icon"] == _currentOrder["icon"]
                      : element["icon"] == _currentSkill["icon"];

                  return skillsTile(
                    isActive: isActive,
                    url: element["icon"],
                    data: element,
                    isOrder: isOrder,
                  );
                }).toList()
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 48),
              width: width * descriptionScale,
              child: descriptionContainer(
                image: isOrder ? _currentOrder["icon"] : _currentSkill["icon"],
                title:
                    isOrder ? _currentOrder["title"] : _currentSkill["title"],
                descriptionText: _currentOrder["description"],
                descriptionList: _currentSkill["description"],
                isOrder: isOrder,
              ))
        ],
      ),
    );
  }

  Widget skillsTile({
    String url,
    bool isActive,
    Map<String, dynamic> data,
    bool isOrder,
  }) {
    return GestureDetector(
      onTap: () =>
          setState(() => isOrder ? _currentOrder = data : _currentSkill = data),
      child: Container(
        width: 96,
        height: 96,
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(12),
        decoration: isActive
            ? BoxDecoration(
                color: Color(0xFFEED3D1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              )
            : null,
        child: Center(
          child: RepaintBoundary(
            child: Image.asset(url, width: 64, height: 64),
          ),
        ),
      ),
    );
  }

  Widget descriptionContainer({
    String image,
    String title,
    List<String> descriptionList,
    String descriptionText,
    bool isOrder = false,
  }) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Image.asset(image,
            height: width < 700 ? 126 : 186, width: width < 700 ? 126 : 186),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ...[
          if (!isOrder)
            for (var desc in descriptionList)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                descriptionText,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  height: 1.3,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            )
        ]
      ],
    );
  }

  Widget _picker({
    List<Map<String, dynamic>> data,
    bool isOrder = false,
  }) {
    CarouselController buttonCarouselController = CarouselController();

    return CarouselSlider(
      options: CarouselOptions(
        height: 75,
        viewportFraction: 0.4,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        onPageChanged: (value, _) => setState(
          () => !isOrder
              ? _currentSkill = data[value]
              : _currentOrder = data[value],
        ),
      ),
      carouselController: buttonCarouselController,
      items: data.map((value) {
        return Builder(
          builder: (BuildContext context) {
            return RepaintBoundary(
              child: Image.asset(
                value["icon"],
                height: 75,
                width: 75,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
