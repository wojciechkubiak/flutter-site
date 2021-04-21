import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './custom-round-button.dart';
import '../bloc/home/home_bloc.dart';
import '../config/colors.dart';

enum ActivePage { LANDING, ABOUT, TECHNOLOGIES, PROJECTS, CONTACT }

class Navbar extends StatefulWidget {
  final ActivePage activePage;
  final bool isTransparent;

  const Navbar({Key key, this.activePage, this.isTransparent = false})
      : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isDropdownShown = false;

  @override
  Widget build(BuildContext context) {
    bool isCompact = MediaQuery.of(context).size.width < 1000;
    bool isHeightMinimal = MediaQuery.of(context).size.height < 600;

    Map<ActivePage, String> translations = {
      ActivePage.LANDING: "Main page",
      ActivePage.ABOUT: "About me",
      ActivePage.TECHNOLOGIES: "Technologies",
      ActivePage.PROJECTS: "Projects",
      ActivePage.CONTACT: "Contact",
    };

    if (isCompact) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: !widget.isTransparent ||
                      isHeightMinimal ||
                      isCompact ||
                      isDropdownShown
                  ? Color(0xFF262626)
                  : Colors.transparent,
            ),
            child: GestureDetector(
              onTap: () => setState(() => isDropdownShown = !isDropdownShown),
              child: Icon(
                isDropdownShown ? Icons.close : Icons.menu,
                color: !widget.isTransparent ||
                        isHeightMinimal ||
                        isCompact ||
                        isDropdownShown
                    ? Colors.white
                    : Colors.black87,
                size: 46,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          if (isDropdownShown)
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF262626),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 0,
                    offset: Offset(0, 5),
                    color: Colors.black54,
                  )
                ],
              ),
              child: Column(
                children: [
                  CustomRoundButton(
                    text: translations[ActivePage.LANDING],
                    onTap: () => BlocProvider.of<HomeBloc>(context)
                        .add(HomeMainPageShow()),
                    isActive: widget.activePage == ActivePage.LANDING,
                  ),
                  CustomRoundButton(
                    text: translations[ActivePage.ABOUT],
                    onTap: () =>
                        BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
                    isActive: widget.activePage == ActivePage.ABOUT,
                  ),
                  CustomRoundButton(
                    text: translations[ActivePage.TECHNOLOGIES],
                    onTap: () => BlocProvider.of<HomeBloc>(context)
                        .add(HomeTechnologiesShow()),
                    isActive: widget.activePage == ActivePage.TECHNOLOGIES,
                  ),
                  CustomRoundButton(
                    text: translations[ActivePage.PROJECTS],
                    onTap: () => BlocProvider.of<HomeBloc>(context)
                        .add(HomeProjectsShow()),
                    isActive: widget.activePage == ActivePage.PROJECTS,
                  ),
                  CustomRoundButton(
                    text: translations[ActivePage.CONTACT],
                    onTap: () => BlocProvider.of<HomeBloc>(context)
                        .add(HomeContactShow()),
                    isActive: widget.activePage == ActivePage.CONTACT,
                  ),
                ],
              ),
            )
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: widget.isTransparent ? Colors.transparent : Color(0xFF262626),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        clipBehavior: Clip.none,
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
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeTechnologiesShow()),
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
          CustomRoundButton(
            text: translations[ActivePage.CONTACT],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeContactShow()),
            isActive: widget.activePage == ActivePage.CONTACT,
            isTextBlack: widget.activePage == ActivePage.LANDING,
          ),
        ],
      ),
    );
  }
}
