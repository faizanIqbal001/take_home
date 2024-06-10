import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/export.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeUseCase homeUseCase;

  HomeScreenBloc({required this.homeUseCase}) : super(HomeScreenState()) {
    on<GetSingleProject>(_getSingleProject);
    on<GetSections>(_getSections);
    on<GetActiveTasks>(_getActiveTasks);
    on<TabSelection>(_tabSelection);
    on<UpdateLists>(_updateLists);
    on<LoadingOnListUpdate>(_loadingForUpdateList);
    on<ChangeTaskSection>(_changeTaskSection);
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
          state.toDo![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.toDo![event.selectedIndex]);
          state.inProgress!.add(state.toDo![event.selectedIndex]);
          state.toDo!.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "Done") {
          state.toDo![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.toDo![event.selectedIndex]);
          state.done!.add(state.toDo![event.selectedIndex]);
          state.toDo!.removeAt(event.selectedIndex);
        }
      }
    }

    if (event.selectedTab == "InProgress") {
      if (event.selectedValue != "InProgress") {
        if (event.selectedValue == "ToDo") {
          state.inProgress![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.inProgress![event.selectedIndex]);
          state.toDo!.add(state.inProgress![event.selectedIndex]);
          state.inProgress!.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "Done") {
          state.inProgress![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.inProgress![event.selectedIndex]);
          state.done!.add(state.inProgress![event.selectedIndex]);
          state.inProgress!.removeAt(event.selectedIndex);
        }
      }
    }

    if (event.selectedTab == "Done") {
      if (event.selectedValue != "Done") {
        if (event.selectedValue == "InProgress") {
          state.done![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.done![event.selectedIndex]);
          state.inProgress!.add(state.done![event.selectedIndex]);
          state.done!.removeAt(event.selectedIndex);
        }
        if (event.selectedValue == "ToDo") {
          state.done![event.selectedIndex].sectionId = getSectionId(
            sectionName: event.selectedValue,
          );
          _deleteTask(state.done![event.selectedIndex]);
          state.toDo!.add(state.done![event.selectedIndex]);
          state.done!.removeAt(event.selectedIndex);
        }
      }
    }

    emit(
      state.copyWith(
        loadingForUpdateLists: false,
      ),
    );
  }

  void _deleteTask(
    ActiveTaskResponseModel activeTaskResponseModel,
  ) async {
    homeUseCase.deleteTask(
      activeTaskResponseModel: activeTaskResponseModel,
    );
    homeUseCase.createTask(
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

  ///
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
}
