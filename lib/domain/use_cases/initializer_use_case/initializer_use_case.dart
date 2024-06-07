import 'package:dartz/dartz.dart';
import 'package:take_home/export.dart';

class InitializerUseCase {
  InitializerRepo initializerRepo;

  InitializerUseCase({
    required this.initializerRepo,
  });


  Future<void> saveUuid() async{
   await initializerRepo.saveUuid();
  }


}
