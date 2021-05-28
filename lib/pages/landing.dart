import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';
import '../bloc/home/home_bloc.dart';
import '../pages/pages.dart';
import './../models/models.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(context),
      activePage: ActivePage.LANDING,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/2bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      isTransparent: true,
    );
  }

  Widget _body(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: height < 600 ? 120 : 40,
            bottom: 20,
          ),
          child: Text(
            "Wojciech Kubiak",
            style: TextStyle(
              height: 1.3,
              fontSize: width < 680
                  ? 44
                  : width < 1600
                      ? 72
                      : 96,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rucas',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          "Developer",
          style: TextStyle(
            fontSize: width < 680 ? 48 : 64,
            fontFamily: 'Raleway',
            color: Colors.grey[800],
          ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: CustomRoundButton(
            text: 'Find out more',
            onTap: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
            isActive: true,
            fontSize: 28,
            margin: const EdgeInsets.symmetric(vertical: 24),
            width: 260,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width > 600 ? 72.0 : 52.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: 'https://www.linkedin.com/in/wojciechkubiakin/',
              ),
              SocialIcon(
                icon: FontAwesomeIcons.githubSquare,
                url: 'https://www.github.com/wojciechkubiak',
              ),
              SocialIcon(
                icon: FontAwesomeIcons.facebookSquare,
                url: 'https://www.facebook.com/wojciechkubiakfb',
              ),
              SocialIcon(
                icon: FontAwesomeIcons.instagramSquare,
                url: 'https://instagram.com/biaqe',
              ),
            ],
          ),
        )
      ],
    );
  }
}
