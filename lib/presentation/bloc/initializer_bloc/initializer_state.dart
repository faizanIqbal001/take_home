part of 'initializer_bloc.dart';

class InitializerState extends Equatable {
  final InitializerStatus status;
  final bool showOnBoarding;
  final bool isUserLoggedIn;

  const InitializerState({
    this.status = InitializerStatus.init,
    this.showOnBoarding = true,
    this.isUserLoggedIn = true,
  });

  InitializerState copyWith({
    InitializerStatus? status,
    bool? showOnBoarding,
    bool? isUserLoggedIn,
  }) {
    return InitializerState(
      status: status ?? this.status,
      showOnBoarding: showOnBoarding ?? this.showOnBoarding,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
    );
  }

  @override
  List<Object?> get props => [
        status,
        showOnBoarding,
        isUserLoggedIn,
      ];
}
