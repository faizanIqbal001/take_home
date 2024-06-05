import '../export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: appConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
        initialRoute: AppRoutes.initializer,
      ),
    );
  }
}
