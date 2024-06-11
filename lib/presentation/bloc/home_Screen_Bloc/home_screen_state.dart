part of 'home_screen_bloc.dart';

//ignore: must_be_immutable
class HomeScreenState extends Equatable {
  final HomeScreenStatus status;
  final SingleProjectResponseModel? singleProjectResponseModel;
  final String? projectName;
  final List<SectionResponseModel>? sections;
  final List<ActiveTaskResponseModel>? activeTasks;

  List<ActiveTaskResponseModel> toDo = [];
  List<ActiveTaskResponseModel> inProgress = [];
  List<ActiveTaskResponseModel> done = [];

  final bool toDoSelected;
  final bool inProgressSelected;
  final bool doneSelected;

  List<String> typesOfTasks = ['ToDo', 'InProgress', 'Done'];
  List<String> taskPriority = ['Urgent', 'High', 'Average', 'Low'];

  final bool loadingForUpdateLists;

  ///Create Task Variables
  final String selectedTaskType;
  final String selectedPriority;

  HomeScreenState({
    this.status = HomeScreenStatus.loading,
    this.singleProjectResponseModel,
    this.projectName,
    this.sections,
    this.activeTasks,
    this.toDo = const [],
    this.inProgress = const [],
    this.done = const [],
    this.toDoSelected = true,
    this.inProgressSelected = false,
    this.doneSelected = false,
    this.typesOfTasks = const ['ToDo', 'InProgress', 'Done'],
    this.taskPriority = const ['Urgent', 'High', 'Average', 'Low'],
    this.loadingForUpdateLists = false,
    this.selectedTaskType = "ToDo",
    this.selectedPriority = "Low",
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
    bool? toDoSelected,
    bool? inProgressSelected,
    bool? doneSelected,
    List<String>? typesOfTasks,
    List<String>? taskPriority,
    bool? loadingForUpdateLists,
    String? selectedTaskType,
    String? selectedPriority,
  }) {
    return HomeScreenState(
      status: status ?? this.status,
      singleProjectResponseModel:
          singleProjectResponseModel ?? this.singleProjectResponseModel,
      projectName: projectName ?? this.projectName,
      sections: sections ?? this.sections,
      taskPriority: taskPriority ?? this.taskPriority,
      activeTasks: activeTasks ?? this.activeTasks,
      toDo: toDo ?? this.toDo,
      inProgress: inProgress ?? this.inProgress,
      done: done ?? this.done,
      toDoSelected: toDoSelected ?? this.toDoSelected,
      inProgressSelected: inProgressSelected ?? this.inProgressSelected,
      doneSelected: doneSelected ?? this.doneSelected,
      typesOfTasks: typesOfTasks ?? this.typesOfTasks,
      loadingForUpdateLists:
          loadingForUpdateLists ?? this.loadingForUpdateLists,
      selectedTaskType: selectedTaskType ?? this.selectedTaskType,
      selectedPriority: selectedPriority ?? this.selectedPriority,
    );
  }

  @override
  List<Object?> get props => [
        status,
        singleProjectResponseModel,
        projectName,
        sections,
        activeTasks,
        taskPriority,
        toDo,
        inProgress,
        done,
        toDoSelected,
        inProgressSelected,
        doneSelected,
        typesOfTasks,
        loadingForUpdateLists,
        selectedTaskType,
        selectedPriority,
      ];
}
