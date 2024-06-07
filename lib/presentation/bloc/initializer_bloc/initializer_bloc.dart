import 'package:take_home/export.dart';

part 'initializer_event.dart';

part 'initializer_state.dart';

class InitializerBloc extends Bloc<InitializerEvent, InitializerState> {
  final InitializerUseCase initializerUseCase;

  InitializerBloc({
    required this.initializerUseCase,
  }) : super(const InitializerState()) {
    on<NavigateToHomeScreen>(_navigateToHomeScreen);
    on<SaveUuid>(_saveUuid);
  }

  _navigateToHomeScreen(NavigateToHomeScreen event, emit) {
    emit(
      state.copyWith(
        status: InitializerStatus.navigateToHome,
      ),
    );
  }

  _saveUuid(SaveUuid event, emit) {
    initializerUseCase.saveUuid();
  }
}
