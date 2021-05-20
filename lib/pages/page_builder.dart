import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './../models/models.dart';

import '../widgets/widgets.dart';

class PageBuilder extends StatefulWidget {
  final Widget child;
  final ActivePage activePage;
  final bool isTransparent;
  final BoxDecoration decoration;

  PageBuilder({
    Key key,
    this.child,
    this.activePage,
    this.decoration,
    this.isTransparent = false,
  }) : super(key: key);

  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  final _drawerController = ZoomDrawerController();
  double opacity = 0;
  bool isMessageFieldVisible = false;
  String mail = '';
  String subject = '';
  String content = '';
  bool isIconVisible = true;
  bool hover = false;

  @override
  initState() {
    super.initState();
    int duration = widget.activePage == ActivePage.LANDING ? 500 : 300;
    Future.delayed(Duration(milliseconds: duration), () {
      setState(() => opacity = 1);
    });
  }

  Future<void> _sendMail() async {
    setState(() => isIconVisible = false);
    try {
      final response = await http.post(
        Uri.https('portolio-email-sender.herokuapp.com', ''),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'mail': {
            'mail': mail,
            'subject': subject,
            'content': content,
          }
        }),
      );
      if (response.statusCode == 200) {
        Future.delayed(
          Duration(milliseconds: 500),
          () => setState(
            () {
              isMessageFieldVisible = false;
              isIconVisible = true;
              mail = subject = content = '';
            },
          ),
        );
      }
    } catch (e) {
      setState(() => isIconVisible = true);
      print(e);
    }
  }

  Map<ActivePage, String> translations = {
    ActivePage.LANDING: "Main page",
    ActivePage.ABOUT: "About me",
    ActivePage.TECHNOLOGIES: "Technologies",
    ActivePage.PROJECTS: "Projects",
    ActivePage.CONTACT: "Contact",
  };

  Widget _mobile() {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.DefaultStyle,
      menuScreen: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[500],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            MenuButtons(
              translations: translations,
              isDrawer: true,
              activePage: widget.activePage,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Created with Flutter 2 by Wojciech Kubiak',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      mainScreen: _web(isDrawerHandler: true),
      borderRadius: 12,
      angle: -12.0,
      backgroundColor: Colors.grey[500],
      slideWidth: MediaQuery.of(context).size.width * .45,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(desktop: _web(), tablet: _web(), mobile: _mobile());
  }

  Widget _web({bool isDrawerHandler = false}) {
    final node = FocusScope.of(context);

    double width = MediaQuery.of(context).size.width;

    bool isHDReady = width <= 1600;
    bool isFilled = mail.isNotEmpty && subject.isNotEmpty && content.isNotEmpty;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: widget.decoration,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 1),
            child: Center(
              child: SingleChildScrollView(
                child: widget.child,
              ),
            ),
          ),
          if (isMessageFieldVisible)
            Align(
              alignment: Alignment.bottomRight,
              child: Stack(
                children: [
                  Container(
                    width: isHDReady ? 600 : 800,
                    decoration: BoxDecoration(
                      borderRadius: width < 600
                          ? BorderRadius.zero
                          : BorderRadius.all(Radius.circular(10)),
                      color: width < 700 ? Colors.grey[300] : Color(0xFFF9F9F9),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                          color: Colors.black26,
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isHDReady ? 24 : 64,
                      vertical: 32,
                    ),
                    margin: EdgeInsets.only(
                      bottom: width >= 600 ? 96 : 0,
                      right: width >= 600 ? 12 : 0,
                    ),
                    child: Column(
                      mainAxisSize:
                          width < 600 ? MainAxisSize.max : MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have a question?',
                          style: TextStyle(
                            fontSize: !isHDReady
                                ? 52
                                : width < 600
                                    ? 36
                                    : 42,
                            color: Colors.grey[800],
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomTextfield(
                          hint: 'Email',
                          keyboardType: TextInputType.text,
                          isTransparent: widget.isTransparent,
                          textInputAction: TextInputAction.next,
                          onChange: (value) => setState(() => mail = value),
                          onEditingComplete: () => node.nextFocus(),
                        ),
                        CustomTextfield(
                          hint: 'Subject',
                          keyboardType: TextInputType.text,
                          isTransparent: widget.isTransparent,
                          textInputAction: TextInputAction.next,
                          onChange: (value) => setState(() => subject = value),
                          onEditingComplete: () => node.nextFocus(),
                        ),
                        CustomTextfield(
                          hint: 'Message',
                          minLines: 5,
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          isTransparent: widget.isTransparent,
                          textInputAction: TextInputAction.done,
                          onChange: (value) => setState(() => content = value),
                          onEditingComplete: () => node.unfocus(),
                        ),
                        if (isIconVisible)
                          SizedBox(
                            height: 60,
                            child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.grey[800],
                                size: 32,
                              ),
                              onPressed: () {
                                if (isFilled) _sendMail();
                              },
                            ),
                          )
                        else
                          SizedBox(
                            height: 60,
                            child: SpinKitFadingCube(
                              color: Colors.grey[800],
                              size: 32,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (!(isMessageFieldVisible && isDrawerHandler))
            Navbar(
              activePage: widget.activePage,
              isTransparent: widget.isTransparent,
              isDrawerHandler: isDrawerHandler,
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => setState(
                  () => isMessageFieldVisible = !isMessageFieldVisible),
              child: MouseRegion(
                onEnter: (_) => setState(() => hover = true),
                onExit: (_) => setState(() => hover = false),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.all(width < 600 ? 2 : 12),
                  padding: EdgeInsets.symmetric(
                    vertical: width < 600 ? 2 : 8,
                    horizontal: width < 600 ? 2 : 16,
                  ),
                  child: FaIcon(
                    !isMessageFieldVisible
                        ? FontAwesomeIcons.commentAlt
                        : FontAwesomeIcons.solidCommentAlt,
                    size: 52,
                    color: hover || width < 600
                        ? Colors.grey[800]
                        : Colors.grey[600],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
