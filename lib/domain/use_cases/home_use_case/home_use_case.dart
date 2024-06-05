import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase({required this.homeRepo});


  HomeStatsEntity homeStatsEntity = HomeStatsEntity.empty();
}
