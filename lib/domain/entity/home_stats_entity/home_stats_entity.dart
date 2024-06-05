class HomeStatsEntity {
  int? approvedCount;
  int? pendingCount;
  int? approvedSum;

  HomeStatsEntity({
    required this.approvedCount,
    required this.approvedSum,
    required this.pendingCount,
  });

  static HomeStatsEntity empty() => HomeStatsEntity(
        approvedCount: 0,
        approvedSum: 0,
        pendingCount: 0,
      );
}
