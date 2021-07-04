import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import './../../services/home_service.dart';

part './home_event.dart';
part './home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;

  HomeBloc(HomeService homeService)
      : assert(homeService != null),
        _homeService = homeService,
        super(HomeInitial());

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeMainPageShow) {
      yield* _mapAppHomeInitialToState(event);
    }
    if (event is HomeAboutShow) {
      yield* _mapAppHomeAboutToState(event);
    }
    if (event is HomeTechnologiesShow) {
      yield* _mapAppHomeTechnologiesToState(event);
    }
    if (event is HomeProjectsShow) {
      yield* _mapAppHomeProjectsToState(event);
    }
    if (event is HomeContactShow) {
      yield* _mapAppHomeContactToState(event);
    }
    if (event is HomeSendContact) {
      yield* _mapAppHomeContactSendToState(event);
    }
  }

  Stream<HomeState> _mapAppHomeInitialToState(HomeMainPageShow event) async* {
    yield HomeInitial();
  }

  Stream<HomeState> _mapAppHomeAboutToState(HomeAboutShow event) async* {
    yield HomeAbout();
  }

  Stream<HomeState> _mapAppHomeTechnologiesToState(
    HomeTechnologiesShow event,
  ) async* {
    List<Map<String, dynamic>> technologies = _homeService.getTechnologies();
    List<Map<String, dynamic>> order = _homeService.getOrderData();

    yield HomeTechnologies(technologies: technologies, order: order);
  }

  Stream<HomeState> _mapAppHomeProjectsToState(HomeProjectsShow event) async* {
    Map<String, dynamic> projects = _homeService.getProjects();

    yield HomeProjects(projects: projects);
  }

  Stream<HomeState> _mapAppHomeContactToState(HomeContactShow event) async* {
    yield HomeContact();
  }

  Stream<HomeState> _mapAppHomeContactSendToState(
      HomeSendContact event) async* {
    yield HomeContact();
  }
}
