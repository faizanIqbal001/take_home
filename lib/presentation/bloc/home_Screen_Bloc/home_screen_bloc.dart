import 'package:take_home/data/export.dart';
import 'package:take_home/data/models/export.dart';
import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/data/models/home_screen_models/export.dart';
import 'package:take_home/export.dart';
import 'package:intl/intl.dart' as date;

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeUseCase homeUseCase;

  HomeScreenBloc({required this.homeUseCase}) : super(const HomeScreenState()) {
    on<GetSingleProject>(_getSingleProject);
    on<GetSections>(_getSections);
    on<GetActiveTasks>(_getActiveTasks);
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
            status: HomeScreenStatus.loaded,
            activeTasks: homeUseCase.activeTasks,
            toDo: homeUseCase.toDo,
            inProgress: homeUseCase.inProgress,
            done: homeUseCase.done,
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
}
