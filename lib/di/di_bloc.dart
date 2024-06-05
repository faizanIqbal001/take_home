import 'package:take_home/export.dart';

Future initializeBlocs() async {
  serviceLocator.registerLazySingleton(
    () => InitializerBloc(
      initializerUseCase: serviceLocator<InitializerUseCase>(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => HomeScreenBloc(
      homeUseCase: serviceLocator<HomeUseCase>(),
    ),
  );

}
