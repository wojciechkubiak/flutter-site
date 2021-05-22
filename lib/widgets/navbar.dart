import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mysite/widgets/website_logo.dart';
import 'package:responsive_builder/responsive_builder.dart';
import './../models/models.dart';
import 'custom_round_button.dart';
import '../bloc/home/home_bloc.dart';
import './menu_buttons.dart';

class Navbar extends StatefulWidget {
  final ActivePage activePage;
  final bool isTransparent;
  final bool isDrawerHandler;
  final Function isMenuHandler;

  const Navbar({
    Key key,
    this.activePage,
    this.isTransparent = false,
    this.isDrawerHandler,
    this.isMenuHandler,
  }) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isDropdownShown = false;

  @override
  Widget build(BuildContext context) {
    bool isCompact = MediaQuery.of(context).size.width < 700;

    Map<ActivePage, String> translations = {
      ActivePage.LANDING: "Main page",
      ActivePage.ABOUT: "About me",
      ActivePage.TECHNOLOGIES: "Technologies",
      ActivePage.PROJECTS: "Projects",
      ActivePage.CONTACT: "Contact",
    };

    return ScreenTypeLayout(
      desktop: _webBar(
        translations: translations,
        isCompact: isCompact,
        isHeightMinimal: false,
      ),
      tablet: _webBar(
        translations: translations,
        isCompact: true,
        isHeightMinimal: true,
      ),
      mobile: _webBar(
        translations: translations,
        isCompact: true,
        isHeightMinimal: true,
      ),
    );
  }

  Widget _webBar({
    Map<ActivePage, String> translations,
    bool isCompact,
    bool isHeightMinimal,
  }) {
    if (isCompact) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.activePage != ActivePage.LANDING
                  ? Colors.grey[300]
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.isDrawerHandler) {
                      if (isDropdownShown) {
                        ZoomDrawer.of(context).close();
                        widget.isMenuHandler(false);
                      } else {
                        ZoomDrawer.of(context).open();
                        widget.isMenuHandler(true);
                      }
                    }

                    setState(() => isDropdownShown = !isDropdownShown);
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey[900],
                    size: 46,
                  ),
                ),
                if (widget.isDrawerHandler &&
                    widget.activePage != ActivePage.LANDING)
                  Padding(
                    padding: const EdgeInsets.only(right: 46),
                    child: Text(
                      translations[widget.activePage],
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 22,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                Container()
              ],
            ),
            alignment: Alignment.centerLeft,
          ),
          if (isDropdownShown && !widget.isDrawerHandler)
            Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                      color: Colors.black54,
                    )
                  ],
                ),
                child: MenuButtons())
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: widget.activePage != ActivePage.LANDING
            ? Colors.grey[300]
            : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WebsiteLogo(),
          Row(
            children: [
              CustomRoundButton(
                text: translations[ActivePage.LANDING],
                onTap: () =>
                    BlocProvider.of<HomeBloc>(context).add(HomeMainPageShow()),
                isActive: widget.activePage == ActivePage.LANDING,
                isTextBlack: false,
              ),
              CustomRoundButton(
                text: translations[ActivePage.ABOUT],
                onTap: () =>
                    BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
                isActive: widget.activePage == ActivePage.ABOUT,
                isTextBlack: widget.activePage == ActivePage.LANDING,
              ),
              CustomRoundButton(
                text: translations[ActivePage.TECHNOLOGIES],
                onTap: () => BlocProvider.of<HomeBloc>(context)
                    .add(HomeTechnologiesShow()),
                isActive: widget.activePage == ActivePage.TECHNOLOGIES,
                isTextBlack: widget.activePage == ActivePage.LANDING,
              ),
              CustomRoundButton(
                text: translations[ActivePage.PROJECTS],
                onTap: () =>
                    BlocProvider.of<HomeBloc>(context).add(HomeProjectsShow()),
                isActive: widget.activePage == ActivePage.PROJECTS,
                isTextBlack: widget.activePage == ActivePage.LANDING,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
