import 'package:take_home/export.dart';

Future initializeRepoDependencies() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton<StorageRepo>(
    () => StorageRepoImpl(sharedPreferences: sharedPreferences),
  );

  serviceLocator.registerLazySingleton<InitializerRepo>(
    () => InitializerRepoImpl(
      storageRepo: storageRepo,
      networkHelper: serviceLocator<NetworkHelper>(),
    ),
  );


  serviceLocator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      networkHelper: serviceLocator<NetworkHelper>(),
      storageRepo: serviceLocator(),
    ),
  );
}
