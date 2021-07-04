part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeAbout extends HomeState {}

class HomeTechnologies extends HomeState {
  final List<Map<String, dynamic>> technologies;
  final List<Map<String, dynamic>> order;

  HomeTechnologies({this.technologies, this.order});

  @override
  List<Object> get props => [technologies, order];
}

class HomeProjects extends HomeState {
  final Map<String, dynamic> projects;

  HomeProjects({this.projects});

  @override
  List<Object> get props => [];
}

class HomeContact extends HomeState {}
