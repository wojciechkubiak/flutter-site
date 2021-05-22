import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import './pages/pages.dart';
import './services/home_service.dart';
import './bloc/home/home_bloc.dart';
import './config/colors.dart';

void main() {
  setUrlStrategy(null);

  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeService>(
          create: (context) {
            return HomeService();
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) {
              final homeService = RepositoryProvider.of<HomeService>(context);
              return HomeBloc(homeService)..add(HomeMainPageShow());
            },
          ),
        ],
        child: MaterialApp(
          title: 'Wojciech Kubiak | Dev',
          theme: ThemeData(primarySwatch: CustomColors().customWhite),
          home: Scaffold(
            body: Theme(
              data: Theme.of(context).copyWith(),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) return Landing();
                  if (state is HomeAbout) return About();
                  if (state is HomeTechnologies) return Technologies();
                  if (state is HomeProjects) return Projects();

                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
