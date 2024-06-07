import 'package:dartz/dartz.dart';
import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/export.dart';

class HomeRepoImpl implements HomeRepo {
  NetworkHelper networkHelper;
  StorageRepo storageRepo;

  HomeRepoImpl({required this.networkHelper, required this.storageRepo});

  @override
  Future<Either<SingleProjectResponseModel, Failure>> getSingleProject({
    required String projectId,
  }) async {
    final response = await networkHelper.get(
      NetworkEndPoints.singleProject.replaceAll("{projectId}", projectId),
    );

    return response.fold(
      (success) {
        SingleProjectResponseModel singleProjectResponseModel =
            SingleProjectResponseModel.fromJson(
          jsonDecode(success),
        );
        return Left(singleProjectResponseModel);
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

  @override
  Future<Either<List<SectionResponseModel>, Failure>> getProjectSections({
    required String projectId,
  }) async {
    final response = await networkHelper.get(
      NetworkEndPoints.sections.replaceAll("{projectId}", projectId),
    );

    return response.fold(
      (success) {
        List<SectionResponseModel> sections = [];
        var dummyList = jsonDecode(success);
        for (var section in dummyList) {
          sections.add(SectionResponseModel.fromJson(section));
        }

        return Left(sections);
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

  @override
  Future<Either<List<ActiveTaskResponseModel>, Failure>>
      getActiveTasks() async {
    final response = await networkHelper.get(
      NetworkEndPoints.activeTasks,
    );

    return response.fold(
      (success) {
        List<ActiveTaskResponseModel> sections = [];
        var dummyList = jsonDecode(success);
        for (var section in dummyList) {
          sections.add(ActiveTaskResponseModel.fromJson(section));
        }

        return Left(sections);
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

  @override
  Future<Either<ActiveTaskResponseModel, Failure>> updateTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    final response = await networkHelper.post(
      NetworkEndPoints.updateTask.replaceAll(
        "{taskId}",
        activeTaskResponseModel.id.toString(),
      ),
      body: activeTaskResponseModel.toJson(),
    );

    return response.fold(
      (success) {
        ActiveTaskResponseModel activeTaskResponseModel;
        activeTaskResponseModel = ActiveTaskResponseModel.fromJson(
          jsonDecode(success),
        );
        return Left(activeTaskResponseModel);
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

  @override
  Future<Either<ActiveTaskResponseModel, Failure>> deleteTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    final response = await networkHelper.delete(
      NetworkEndPoints.updateTask.replaceAll(
        "{taskId}",
        activeTaskResponseModel.id.toString(),
      ),
    );

    return response.fold(
      (success) {
        ActiveTaskResponseModel activeTaskResponseModel;
        activeTaskResponseModel = ActiveTaskResponseModel.fromJson(
          jsonDecode(success),
        );
        return Left(activeTaskResponseModel);
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

  @override
  Future<Either<String, Failure>> createTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  }) async {
    final response = await networkHelper.post(
      NetworkEndPoints.activeTasks.replaceAll(
        "{taskId}",
        activeTaskResponseModel.id.toString(),
      ),
      body: activeTaskResponseModel.toJson(),
    );

    return response.fold(
      (success) {
        return const Left("!");
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

  @override
  Future<String> getUuid() async {
    return storageRepo.getString(
      key: StorageKey.uuid,
    );
  }
}
