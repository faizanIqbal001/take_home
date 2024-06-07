import 'package:take_home/export.dart';

class InitializerScreen extends StatefulWidget {
  const InitializerScreen({super.key});

  @override
  State<InitializerScreen> createState() => _InitializerScreenState();
}

class _InitializerScreenState extends State<InitializerScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<InitializerBloc>().add(SaveUuid());
    Future.delayed(
      const Duration(seconds: 5),
      () {
        context.read<InitializerBloc>().add(
              NavigateToHomeScreen(),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitializerBloc, InitializerState>(
        listener: (context, state) {
      switch (state.status) {
        case InitializerStatus.navigateToHome:
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          );
          break;
        default:
          break;
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Take Home",
              style: textStyles.extraBold.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 150,
              ),
              child: LinearProgressIndicator(
                minHeight: 10,
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      );
    });
  }
}
