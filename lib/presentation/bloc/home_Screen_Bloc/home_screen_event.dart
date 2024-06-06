part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class GetSingleProject extends HomeScreenEvent {}
class GetSections extends HomeScreenEvent {}
class GetActiveTasks extends HomeScreenEvent {}



