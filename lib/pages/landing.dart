import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/pages/pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/widgets.dart';
import '../bloc/home/home_bloc.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBuilder(
      child: _body(context),
      activePage: ActivePage.LANDING,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg7b.jpg'),
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
                      ? 112
                      : 96,
              color: Colors.grey[700],
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
        CustomRoundButton(
          text: 'Find out more',
          onTap: () => BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
          isActive: true,
          fontSize: 28,
          margin: const EdgeInsets.symmetric(vertical: 24),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width > 600 ? 72.0 : 52.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialImage(
                icon: FontAwesomeIcons.linkedin,
                context: context,
              ),
              _socialImage(
                icon: FontAwesomeIcons.githubSquare,
                context: context,
              ),
              _socialImage(
                icon: FontAwesomeIcons.facebookSquare,
                context: context,
              ),
              _socialImage(
                icon: FontAwesomeIcons.instagramSquare,
                context: context,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _socialImage({IconData icon, BuildContext context}) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(horizontal: width > 600 ? 12 : 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.grey[800],
          width: 3.0,
        ),
      ),
      child: Center(
          child: FaIcon(
        icon,
        color: Colors.grey[800],
        size: 32,
      )),
    );
  }
}
