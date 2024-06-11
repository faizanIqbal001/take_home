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

  final bool loadingForUpdateLists;

  ///Create Task Variables
  TextEditingController? taskTitleController = TextEditingController();
  TextEditingController? taskDescriptionController = TextEditingController();
  final String selectedTaskType;
  int selectedPriority = 4;

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
    this.loadingForUpdateLists = false,
    this.taskTitleController,
    this.taskDescriptionController,
    this.selectedTaskType = "ToDo",
    this.selectedPriority = 1,
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
    bool? loadingForUpdateLists,
    TextEditingController? taskTitleController,
    TextEditingController? taskDescriptionController,
    String? selectedTaskType,
    int? selectedPriority,
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
      toDoSelected: toDoSelected ?? this.toDoSelected,
      inProgressSelected: inProgressSelected ?? this.inProgressSelected,
      doneSelected: doneSelected ?? this.doneSelected,
      typesOfTasks: typesOfTasks ?? this.typesOfTasks,
      loadingForUpdateLists:
          loadingForUpdateLists ?? this.loadingForUpdateLists,
      taskTitleController: taskTitleController ?? this.taskTitleController,
      taskDescriptionController:
          taskTitleController ?? this.taskDescriptionController,
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
        toDo,
        inProgress,
        done,
        toDoSelected,
        inProgressSelected,
        doneSelected,
        typesOfTasks,
        loadingForUpdateLists,
        taskTitleController,
        taskDescriptionController,
        selectedTaskType,
        selectedPriority,
      ];
}
