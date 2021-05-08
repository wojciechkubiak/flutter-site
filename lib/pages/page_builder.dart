import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';
import '../bloc/home/home_bloc.dart';

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
  double opacity = 0;
  bool isMessageFieldVisible = false;

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool isHDReady = width <= 1600;

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
                      color: widget.isTransparent
                          ? Colors.white
                          : Color(0xFF262626),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                          color: Colors.black45,
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
                            color: Colors.orangeAccent,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomTextfield(
                          hint: 'Email',
                          keyboardType: TextInputType.text,
                          isTransparent: widget.isTransparent,
                        ),
                        CustomTextfield(
                          hint: 'Subject',
                          keyboardType: TextInputType.text,
                          isTransparent: widget.isTransparent,
                        ),
                        CustomTextfield(
                          hint: 'Message',
                          maxLines: isHDReady ? 4 : 8,
                          keyboardType: TextInputType.multiline,
                          isTransparent: widget.isTransparent,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send,
                            color: widget.isTransparent
                                ? Colors.black87
                                : Colors.white,
                            size: 32,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Navbar(
            activePage: widget.activePage,
            isTransparent: widget.isTransparent,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => setState(
                  () => isMessageFieldVisible = !isMessageFieldVisible),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:
                      widget.isTransparent ? Colors.white : Color(0xFF262626),
                ),
                margin: const EdgeInsets.all(12.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Icon(
                  !isMessageFieldVisible ? Icons.message : Icons.close,
                  color: Colors.orangeAccent,
                  size: 48,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
