import 'package:take_home/export.dart';

late StorageRepo storageRepo;

Future initializeNetworkDependencies() async {
  storageRepo = StorageRepoImpl(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  serviceLocator.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(
      storageRepo: storageRepo,
    ),
  );
}
