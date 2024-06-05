import 'package:get_it/get_it.dart';
import 'package:take_home/export.dart';


GetIt serviceLocator = GetIt.instance;

Future initializeDependencies() async {
  await Future.wait(
    [
      initializeNetworkDependencies(),
      initializeRepoDependencies(),
      initializeUseCaseDependencies(),
      initializeBlocs(),
    ],
  );
}
