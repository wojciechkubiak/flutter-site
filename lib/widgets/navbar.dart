import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './custom-round-button.dart';
import '../bloc/home/home_bloc.dart';
import '../config/colors.dart';

enum ActivePage { LANDING, ABOUT, TECHNOLOGIES, PROJECTS, CONTACT }

class Navbar extends StatelessWidget {
  final ActivePage activePage;
  final bool isTransparent;

  const Navbar({Key key, this.activePage, this.isTransparent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<ActivePage, String> translations = {
      ActivePage.LANDING: "Main page",
      ActivePage.ABOUT: "About me",
      ActivePage.TECHNOLOGIES: "Technologies",
      ActivePage.PROJECTS: "Projects",
      ActivePage.CONTACT: "Contact",
    };

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isTransparent ? Colors.transparent : Color(0xFF262626),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        clipBehavior: Clip.none,
        children: [
          CustomRoundButton(
            text: translations[ActivePage.LANDING],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeMainPageShow()),
            isActive: activePage == ActivePage.LANDING,
            isTextBlack: false,
          ),
          CustomRoundButton(
            text: translations[ActivePage.ABOUT],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
            isActive: activePage == ActivePage.ABOUT,
            isTextBlack: activePage == ActivePage.LANDING,
          ),
          CustomRoundButton(
            text: translations[ActivePage.TECHNOLOGIES],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeTechnologiesShow()),
            isActive: activePage == ActivePage.TECHNOLOGIES,
            isTextBlack: activePage == ActivePage.LANDING,
          ),
          CustomRoundButton(
            text: translations[ActivePage.PROJECTS],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeProjectsShow()),
            isActive: activePage == ActivePage.PROJECTS,
            isTextBlack: activePage == ActivePage.LANDING,
          ),
          CustomRoundButton(
            text: translations[ActivePage.CONTACT],
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeContactShow()),
            isActive: activePage == ActivePage.CONTACT,
            isTextBlack: activePage == ActivePage.LANDING,
          ),
        ],
      ),
    );
  }
}
