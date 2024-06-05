import 'package:take_home/export.dart';

part 'initializer_event.dart';

part 'initializer_state.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  final InitializerUseCase initializerUseCase;

  InitializerBloc({
    required this.initializerUseCase,
  }) : super(const InitializerState()) {
    on<NavigateToHomeScreen>(_navigateToHomeScreen);
  }

  _navigateToHomeScreen(NavigateToHomeScreen event, emit) {
    emit(
      state.copyWith(
        status: InitializerStatus.navigateToHome,
      ),
    );
  }
}
