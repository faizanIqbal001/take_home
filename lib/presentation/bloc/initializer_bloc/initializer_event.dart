part of 'initializer_bloc.dart';

abstract class InitializerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigateToHomeScreen extends InitializerEvent {}
class SaveUuid extends InitializerEvent {}
