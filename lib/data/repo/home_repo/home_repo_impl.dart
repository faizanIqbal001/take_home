import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

class HomeRepoImpl implements HomeRepo {
  NetworkHelper networkHelper;
  StorageRepo storageRepo;

  HomeRepoImpl({required this.networkHelper, required this.storageRepo});

  @override
  Future<Either<GetAgentInfoResponseModel, Failure>> getAgentInfo(
    String agentId,
  ) async {
    final response = await networkHelper.get(
      NetworkEndPoints.getAgentInfo.replaceAll("{agentId}", agentId),
    );

    return response.fold(
      (success) {
        GetAgentInfoResponseModel getAgentInfoResponseModel =
            GetAgentInfoResponseModel.fromJson(
          jsonDecode(success),
        );
        return Left(getAgentInfoResponseModel);
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
  Future<Either<GetTransactionsResponse, Failure>> getTransactions() async {
    final response = await networkHelper.get(
      NetworkEndPoints.getTransactions.replaceAll(
        '{agentId}',
        storageRepo.getInt(key: StorageKey.id).toString(),
      ),
    );

    return response.fold(
      (success) {
        var decodeJson = jsonDecode(success);
        if (decodeJson == null) {
          return Right(
            Failure(
              status: false,
              message: appConstants.serverIsNotResponding,
            ),
          );
        }
        if (decodeJson['status'] == null) {
          return Right(
            Failure(
              status: false,
              message: appConstants.serverIsNotResponding,
            ),
          );
        }
        GetTransactionsResponse transactionsResponse =
            GetTransactionsResponse.fromJson(
          jsonDecode(success),
        );
        if (transactionsResponse.status ?? false) {
          return Left(
            transactionsResponse,
          );
        } else {
          return Right(
            Failure(
              status: false,
              message: transactionsResponse.statusMsg.toString(),
            ),
          );
        }
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
  Future<Either<HomeStatsResponse, Failure>> getHomeStats({
    required String startDate,
    required String endDate,
  }) async {
    final response = await networkHelper.get(
      NetworkEndPoints.getAgentStats
          .replaceAll(
            '{agentId}',
            storageRepo.getInt(key: StorageKey.id).toString(),
          )
          .replaceAll(
            '{startDate}',
            startDate,
          )
          .replaceAll(
            '{endDate}',
            endDate,
          ),
    );

    return response.fold(
      (success) {
        var decodeJson = jsonDecode(success);

        if (decodeJson == null) {
          return Right(
            Failure(
              status: false,
              message: appConstants.serverIsNotResponding,
            ),
          );
        }

        if (decodeJson['status'] == null) {
          return Right(
            Failure(
              status: false,
              message: appConstants.serverIsNotResponding,
            ),
          );
        }
        HomeStatsResponse homeStatsResponse = HomeStatsResponse.fromJson(
          jsonDecode(success),
        );
        if (homeStatsResponse.status ?? false) {
          return Left(
            homeStatsResponse,
          );
        } else {
          return Right(
            Failure(
              status: false,
              message: homeStatsResponse.statusMsg.toString(),
            ),
          );
        }
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
}
