part of 'home_screen_bloc.dart';

//ignore: must_be_immutable
class HomeScreenState extends Equatable {
  final HomeScreenStatus status;
  final SingleProjectResponseModel? singleProjectResponseModel;
  final String? projectName;
  final List<SectionResponseModel>? sections;
  final List<ActiveTaskResponseModel>? activeTasks;

  final List<ActiveTaskResponseModel>? toDo;
  final List<ActiveTaskResponseModel>? inProgress;
  final List<ActiveTaskResponseModel>? done;

  const HomeScreenState({
    this.status = HomeScreenStatus.loading,
    this.singleProjectResponseModel,
    this.projectName,
    this.sections,
    this.activeTasks,
    this.toDo,
    this.inProgress,
    this.done,
  });

  HomeScreenState copyWith({
    HomeScreenStatus? status,
    SingleProjectResponseModel? singleProjectResponseModel,
    String? projectName,
    List<SectionResponseModel>? sections,
    List<ActiveTaskResponseModel>? activeTasks,
    List<ActiveTaskResponseModel>? toDo,
    List<ActiveTaskResponseModel>? inProgress,
    List<ActiveTaskResponseModel>? done,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      singleProjectResponseModel:
          singleProjectResponseModel ?? this.singleProjectResponseModel,
      projectName: projectName ?? this.projectName,
      sections: sections ?? this.sections,
      activeTasks: activeTasks ?? this.activeTasks,
      toDo: toDo ?? this.toDo,
      inProgress: inProgress ?? this.inProgress,
      done: done ?? this.done,
    );
  }

  @override
  List<Object?> get props => [
        status,
        singleProjectResponseModel,
        projectName,
        sections,
        activeTasks,
        toDo,
        inProgress,
        done,
      ];
}
