import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/export.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeUseCase homeUseCase;

  HomeScreenBloc({required this.homeUseCase}) : super(HomeScreenState()) {
    on<ChangeStatus>(_changeStatus);
    on<GetSingleProject>(_getSingleProject);
    on<GetSections>(_getSections);
    on<GetActiveTasks>(_getActiveTasks);
    on<TabSelection>(_tabSelection);
    on<UpdateLists>(_updateLists);
    on<LoadingOnListUpdate>(_loadingForUpdateList);
    on<ChangeTaskSection>(_changeTaskSection);
    on<ChangePrioritySection>(_changePrioritySection);
    on<CreateNewTask>(_createNewTask);
    on<RemoveTask>(_removeTask);
  }

  void _changeStatus(ChangeStatus event, emit) {
    emit(
      state.copyWith(
        status: event.status,
      ),
    );
  }

  Future<void> _removeTask(RemoveTask event, emit) async {
    if (state.toDoSelected) {
      await homeUseCase.deleteTask(
        activeTaskResponseModel: state.toDo.elementAt(event.index),
      );
      state.toDo.removeAt(event.index);
    }
    if (state.inProgressSelected) {
      await homeUseCase.deleteTask(
        activeTaskResponseModel: state.inProgress.elementAt(event.index),
      );
      state.inProgress.removeAt(event.index);
    }
    if (state.doneSelected) {
      await homeUseCase.deleteTask(
        activeTaskResponseModel: state.done.elementAt(event.index),
      );
      state.done.removeAt(event.index);
    }
    emit(
      state.copyWith(
        toDo: state.toDo,
        inProgress: state.inProgress,
        done: state.done,
        status: HomeScreenStatus.taskRemoved,
      ),
    );
  }

  void _getSingleProject(
    GetSingleProject event,
    emit,
  ) async {
    final response = await homeUseCase.getSingleProject();
    response.fold(
      (success) {
        emit(
          state.copyWith(
            singleProjectResponseModel: homeUseCase.singleProjectResponseModel,
            projectName: homeUseCase.singleProjectResponseModel!.name ?? '',
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: HomeScreenStatus.error,
          ),
        );
      },
    );
  }

  void _getSections(
    GetSections event,
    emit,
  ) async {
    final response = await homeUseCase.getSections();
    response.fold(
      (success) {
        emit(
          state.copyWith(
            sections: homeUseCase.sections,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: HomeScreenStatus.error,
          ),
        );
      },
    );
  }

  void _getActiveTasks(
    GetActiveTasks event,
    emit,
  ) async {
    final response = await homeUseCase.getActiveTasks();
    response.fold(
      (success) {
        emit(
          state.copyWith(
            activeTasks: homeUseCase.activeTasks,
            toDo: homeUseCase.toDo,
            inProgress: homeUseCase.inProgress,
            done: homeUseCase.done,
            status: HomeScreenStatus.loaded,
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            status: HomeScreenStatus.error,
          ),
        );
      },
    );
  }

  /// Tab Selection Event Impl
  void _tabSelection(
    TabSelection event,
    emit,
  ) async {
    emit(
      state.copyWith(
        toDoSelected: event.toDo,
        inProgressSelected: event.inProgress,
        doneSelected: event.done,
      ),
    );
  }

  /// Tab Loading Event
  void _loadingForUpdateList(
    LoadingOnListUpdate event,
    emit,
  ) async {
    emit(
      state.copyWith(
        loadingForUpdateLists: event.isLoading,
      ),
    );
  }

  /// Update Lists OF Tasks
  void _updateLists(
    UpdateLists event,
    emit,
  ) async {
    if (event.selectedTab == "ToDo") {
      if (event.selectedValue != "ToDo") {
        if (event.selectedValue == "InProgress") {
          state.toDo[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.toDo[event.selectedIndex]);
          _createTask(state.toDo[event.selectedIndex]);
          state.inProgress.add(state.toDo[event.selectedIndex]);
          state.toDo.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "Done") {
          state.toDo[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.toDo[event.selectedIndex]);
          _createTask(state.toDo[event.selectedIndex]);
          state.done.add(state.toDo[event.selectedIndex]);
          state.toDo.removeAt(event.selectedIndex);
        }
      }
    }

    if (event.selectedTab == "InProgress") {
      if (event.selectedValue != "InProgress") {
        if (event.selectedValue == "ToDo") {
          state.inProgress[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.inProgress[event.selectedIndex]);
          _createTask(state.inProgress[event.selectedIndex]);
          state.toDo.add(state.inProgress[event.selectedIndex]);
          state.inProgress.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "Done") {
          state.inProgress[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.inProgress[event.selectedIndex]);
          _createTask(state.inProgress[event.selectedIndex]);
          state.done.add(state.inProgress[event.selectedIndex]);
          state.inProgress.removeAt(event.selectedIndex);
        }
      }
    }

    if (event.selectedTab == "Done") {
      if (event.selectedValue != "Done") {
        if (event.selectedValue == "InProgress") {
          state.done[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.done[event.selectedIndex]);
          _createTask(state.done[event.selectedIndex]);
          state.inProgress.add(state.done[event.selectedIndex]);
          state.done.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "ToDo") {
          state.done[event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.done[event.selectedIndex]);
          _createTask(state.done[event.selectedIndex]);
          state.toDo.add(state.done[event.selectedIndex]);
          state.done.removeAt(event.selectedIndex);
        }
      }
    }

    emit(
      state.copyWith(
        loadingForUpdateLists: false,
      ),
    );
  }

  Future<void> _deleteTask(
    ActiveTaskResponseModel activeTaskResponseModel,
  ) async {
    await homeUseCase.deleteTask(
      activeTaskResponseModel: activeTaskResponseModel,
    );
  }

  void _createTask(
    ActiveTaskResponseModel activeTaskResponseModel,
  ) async {
    await homeUseCase.createTask(
      activeTaskResponseModel: activeTaskResponseModel,
    );
  }

  String getSectionId({
    required String sectionName,
  }) {
    for (int i = 0; i < homeUseCase.sections!.length; i++) {
      if (homeUseCase.sections![i].name == sectionName) {
        return homeUseCase.sections![i].id.toString();
      }
    }
    return "";
  }

  ///Change Task Type
  void _changeTaskSection(
    ChangeTaskSection event,
    emit,
  ) async {
    emit(
      state.copyWith(
        selectedTaskType: event.selectedType,
      ),
    );
  }

  ///Change Priority
  void _changePrioritySection(
    ChangePrioritySection event,
    emit,
  ) async {
    emit(
      state.copyWith(
        selectedPriority: event.selectedPriority,
      ),
    );
  }

  ///Change Priority
  void _createNewTask(
    CreateNewTask event,
    emit,
  ) async {
    ActiveTaskResponseModel activeTaskResponseModel = ActiveTaskResponseModel();
    if (state.selectedPriority == "Low") {
      activeTaskResponseModel.priority = 1;
    }
    if (state.selectedPriority == "Average") {
      activeTaskResponseModel.priority = 2;
    }
    if (state.selectedPriority == "High") {
      activeTaskResponseModel.priority = 3;
    }
    if (state.selectedPriority == "Urgent") {
      activeTaskResponseModel.priority = 4;
    }

    activeTaskResponseModel.sectionId =
        getSectionId(sectionName: state.selectedTaskType);
    activeTaskResponseModel.content = event.title;
    activeTaskResponseModel.description = event.description;

    await homeUseCase
        .createTask(activeTaskResponseModel: activeTaskResponseModel)
        .whenComplete(() {
      // if (state.selectedTaskType == "ToDo") {
      //   homeUseCase.toDo.add(activeTaskResponseModel);
      // }
      // if (state.selectedTaskType == "InProgress") {
      //   homeUseCase.inProgress.add(activeTaskResponseModel);
      // }
      // if (state.selectedTaskType == "Done") {
      //   homeUseCase.done.add(activeTaskResponseModel);
      // }
      emit(
        state.copyWith(
          status: HomeScreenStatus.taskCreatedSuccess,
          toDo: homeUseCase.toDo,
          inProgress: homeUseCase.inProgress,
          done: homeUseCase.done,
        ),
      );
    });
  }
}
