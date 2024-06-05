import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

class HomeRepoImpl implements HomeRepo {
  NetworkHelper networkHelper;
  StorageRepo storageRepo;

  HomeRepoImpl({required this.networkHelper, required this.storageRepo});

  // @override
  // Future<Either<GetAgentInfoResponseModel, Failure>> getAgentInfo(
  //   String agentId,
  // ) async {
  //   final response = await networkHelper.get(
  //     NetworkEndPoints.getAgentInfo.replaceAll("{agentId}", agentId),
  //   );
  //
  //   return response.fold(
  //     (success) {
  //       GetAgentInfoResponseModel getAgentInfoResponseModel =
  //           GetAgentInfoResponseModel.fromJson(
  //         jsonDecode(success),
  //       );
  //       return Left(getAgentInfoResponseModel);
  //     },
  //     (error) {
  //       return Right(
  //         Failure(
  //           status: false,
  //           message: error.message,
  //         ),
  //       );
  //     },
  //   );
  // }

}
