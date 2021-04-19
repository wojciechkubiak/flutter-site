part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeAbout extends HomeState {}

class HomeTechnologies extends HomeState {}

class HomeProjects extends HomeState {}

class HomeContact extends HomeState {}
