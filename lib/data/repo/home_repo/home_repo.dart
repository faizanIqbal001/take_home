import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

mixin HomeRepo {
  Future<Either<GetAgentInfoResponseModel, Failure>> getAgentInfo(
    String agentId,
  );

  Future<Either<GetTransactionsResponse, Failure>> getTransactions();

  Future<Either<HomeStatsResponse, Failure>> getHomeStats({
    required String startDate,
    required String endDate,
  });

}
