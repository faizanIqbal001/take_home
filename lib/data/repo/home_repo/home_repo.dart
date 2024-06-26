import 'package:dartz/dartz.dart';
import 'package:take_home/data/models/home_screen_models/active_task_response_model.dart';
import 'package:take_home/export.dart';

mixin HomeRepo {
  // Future<Either<GetAgentInfoResponseModel, Failure>> getAgentInfo(
  //   String agentId,
  // );
  //
  Future<Either<SingleProjectResponseModel, Failure>> getSingleProject({
    required String projectId,
  });

  Future<Either<List<SectionResponseModel>, Failure>> getProjectSections({
    required String projectId,
  });

  Future<Either<List<ActiveTaskResponseModel>, Failure>> getActiveTasks();

  Future<String> getUuid();

  Future<Either<ActiveTaskResponseModel, Failure>> updateTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  });

  Future<Either<String, Failure>> createTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  });

  Future<Either<ActiveTaskResponseModel, Failure>> deleteTask({
    required ActiveTaskResponseModel activeTaskResponseModel,
  });
}
