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

  @override
  initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => opacity = 1);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Navbar(
            activePage: widget.activePage,
            isTransparent: widget.isTransparent,
          )
        ],
      ),
    );
  }
}
