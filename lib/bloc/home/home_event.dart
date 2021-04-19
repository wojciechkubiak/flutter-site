part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeMainPageShow extends HomeEvent {}

class HomeAboutShow extends HomeEvent {}

class HomeTechnologiesShow extends HomeEvent {}

class HomeProjectsShow extends HomeEvent {}

class HomeContactShow extends HomeEvent {}

class HomeSendContact extends HomeEvent {}
