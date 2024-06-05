import 'package:flutter/services.dart';
import 'export.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
   //   await Firebase.initializeApp();
      await initializeDependencies();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ],
      );
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: serviceLocator<InitializerBloc>()
                // ..add(
                //   ShowOnBoarding(),
                // ),
                ),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stack) {
      // TODO: store error stack trace;
    },
  );
}
