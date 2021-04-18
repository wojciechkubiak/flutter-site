import 'package:flutter/material.dart';
import './custom-round-button.dart';

enum ActivePage { LANDING, ABOUT, TECHNOLOGIES, SKILLS, CONTACT }

class Navbar extends StatelessWidget {
  final ActivePage activePage;

  const Navbar({Key key, this.activePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<ActivePage, String> translations = {
      ActivePage.LANDING: "Main page",
      ActivePage.ABOUT: "About me",
      ActivePage.TECHNOLOGIES: "Technologies",
      ActivePage.SKILLS: "Skills",
      ActivePage.CONTACT: "Contact",
    };

    return Container(
      height: 64,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...translations.entries
                .map((entry) => CustomRoundButton(
                      text: entry.value,
                      onTap: () {},
                      isActive: activePage == entry.key,
                      isTextBlack: (entry.key != ActivePage.LANDING &&
                              activePage != entry.key) ||
                          activePage != entry.key,
                    ))
                .toList()
          ]),
    );
  }
}
