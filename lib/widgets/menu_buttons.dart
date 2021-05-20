import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/home_bloc.dart';

import 'custom_round_button.dart';
import './../models/models.dart';

class MenuButtons extends StatelessWidget {
  final Map<ActivePage, String> translations;
  final ActivePage activePage;
  final bool isDrawer;

  const MenuButtons({
    Key key,
    this.translations,
    this.activePage,
    this.isDrawer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomRoundButton(
          text: translations[ActivePage.LANDING],
          onTap: () =>
              BlocProvider.of<HomeBloc>(context).add(HomeMainPageShow()),
          isActive: activePage == ActivePage.LANDING,
          width: 260,
          isMobileNavbar: true,
          isDrawer: isDrawer,
        ),
        CustomRoundButton(
          text: translations[ActivePage.ABOUT],
          onTap: () => BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
          isActive: activePage == ActivePage.ABOUT,
          width: 260,
          isMobileNavbar: true,
          isDrawer: isDrawer,
        ),
        CustomRoundButton(
          text: translations[ActivePage.TECHNOLOGIES],
          onTap: () =>
              BlocProvider.of<HomeBloc>(context).add(HomeTechnologiesShow()),
          isActive: activePage == ActivePage.TECHNOLOGIES,
          width: 260,
          isMobileNavbar: true,
          isDrawer: isDrawer,
        ),
        CustomRoundButton(
          text: translations[ActivePage.PROJECTS],
          onTap: () =>
              BlocProvider.of<HomeBloc>(context).add(HomeProjectsShow()),
          isActive: activePage == ActivePage.PROJECTS,
          width: 260,
          isMobileNavbar: true,
          isDrawer: isDrawer,
        ),
      ],
    );
  }
}
