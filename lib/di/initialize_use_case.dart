import 'package:take_home/export.dart';

Future initializeUseCaseDependencies() async {
  await initializerUseCase();
  await homeUseCase();
}

Future initializerUseCase() async {
  serviceLocator.registerLazySingleton<InitializerUseCase>(
    () => InitializerUseCase(
      initializerRepo: serviceLocator<InitializerRepo>(),
    ),
  );
}


Future homeUseCase() async {
  serviceLocator.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(
      homeRepo: serviceLocator<HomeRepo>(),
    ),
  );
}

