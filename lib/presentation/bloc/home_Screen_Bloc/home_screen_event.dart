part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSingleProject extends HomeScreenEvent {}

class GetSections extends HomeScreenEvent {}

class GetActiveTasks extends HomeScreenEvent {}

class UpdateTask extends HomeScreenEvent {
  ActiveTaskResponseModel activeTaskResponseModel;

  UpdateTask({required this.activeTaskResponseModel});
}

class LoadingOnListUpdate extends HomeScreenEvent {
  bool isLoading;

  LoadingOnListUpdate({required this.isLoading});
}

class TabSelection extends HomeScreenEvent {
  bool toDo;
  bool inProgress;
  bool done;

  TabSelection({
    required this.toDo,
    required this.inProgress,
    required this.done,
  });
}

class UpdateLists extends HomeScreenEvent {
  String selectedValue;
  String selectedTab;
  int selectedIndex;

  UpdateLists({
    required this.selectedValue,
    required this.selectedTab,
    required this.selectedIndex,
  });
}

class ChangeTaskSection extends HomeScreenEvent {
  String selectedType;

  ChangeTaskSection({
    required this.selectedType,
  });
}
