import 'package:dartz/dartz.dart';
import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/export.dart';

class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase({required this.homeRepo});

  SingleProjectResponseModel? singleProjectResponseModel;
  List<SectionResponseModel>? sections;
  List<ActiveTaskResponseModel> activeTasks = [];

  List<ActiveTaskResponseModel> toDo = [];
  List<ActiveTaskResponseModel> inProgress = [];
  List<ActiveTaskResponseModel> done = [];

  List<String> types = ['To Do', 'In Progress', 'Done'];

  String Uuid = "";

  ///Get Specific Project Based On Id
  Future<Either<Success, Failure>> getSingleProject() async {
    getUuid();
    final response = await homeRepo.getSingleProject(
      projectId: "2334298201",
    );
    return response.fold(
      (success) {
        singleProjectResponseModel = success;
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

  ///Get Available Sections In Project
  Future<Either<Success, Failure>> getSections() async {
    final response = await homeRepo.getProjectSections(
      projectId: "2334298201",
    );
    return response.fold(
      (success) {
        sections = success;
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

  ///Update Task
  Future<Either<Success, Failure>> upDateTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    final response = await homeRepo.updateTask(
      activeTaskResponseModel: activeTaskResponseModel,
    );
    return response.fold(
      (success) {
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

  ///Create Task
  Future<Either<Success, Failure>> createTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    final response = await homeRepo.createTask(
      activeTaskResponseModel: activeTaskResponseModel,
    );
    return response.fold(
      (success) {
        for(var section in sections!){
          // if(section.id == success.sectionId && section.name == "ToDo"){
          //   toDo.remove(success);
          //   toDo.add(success);
          // }
          // if(section.id == success.sectionId && section.name == "InProgress"){
          //   inProgress.remove(success);
          //   inProgress.add(success);
          // }
          // if(section.id == success.sectionId && section.name == "Done"){
          //   done.remove(success);
          //   done.add(success);
          // }
        }
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

  ///Delete Task
  Future<Either<Success, Failure>> deleteTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    try {
      final response = await homeRepo.deleteTask(
        activeTaskResponseModel: activeTaskResponseModel,
      );
      return response.fold(
        (success) {
          return Left(
            Success(),
          );
        },
        (error) {
          return Right(
            Failure(
              status: false,
              message: error.message,
            ),
          );
        },
      );
    } catch (e) {
      return Right(
        Failure(
          status: false,
          message: e.toString(),
        ),
      );
    }
  }

  ///Get Active Tasks
  Future<Either<Success, Failure>> getActiveTasks() async {
    final response = await homeRepo.getActiveTasks();
    return response.fold(
      (success) async {
        activeTasks = success;
        await populateDataInDifferentLists();
        return Left(
          Success(),
        );
      },
      (error) {
        return Right(
          Failure(
            status: false,
            message: error.message,
          ),
        );
      },
    );
  }

  ///Populate Each Sections Data e.g ToDo, InProgress, Done,
  Future<void> populateDataInDifferentLists() async {
    for (int i = 0; i < sections!.length; i++) {
      for (int j = 0; j < activeTasks!.length; j++) {
        if (i == 0) {
          if (sections![i].id == activeTasks![j].sectionId) {
            toDo.add(activeTasks![j]);
          }
        }
        if (i == 1) {
          if (sections![i].id == activeTasks![j].sectionId) {
            inProgress.add(activeTasks![j]);
          }
        }
        if (i == 2) {
          if (sections![i].id == activeTasks![j].sectionId) {
            done.add(activeTasks![j]);
          }
        }
      }
    }
  }

  Future<void> getUuid() async {
    Uuid = await homeRepo.getUuid();
  }
}
