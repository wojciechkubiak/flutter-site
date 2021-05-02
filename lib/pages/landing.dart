import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/pages/pages.dart';

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
          image: AssetImage('assets/349801.jpg'),
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
              color: Colors.white70,
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
          padding: const EdgeInsets.only(bottom: 30.0),
          child: IconButton(
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(HomeAboutShow()),
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
      ],
    );
  }
}
