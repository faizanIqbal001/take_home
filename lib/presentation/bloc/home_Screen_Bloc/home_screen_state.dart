part of 'home_screen_bloc.dart';

//ignore: must_be_immutable
class HomeScreenState extends Equatable {
  final HomeScreenStatus status;

  HomeScreenState({
    this.status = HomeScreenStatus.loading,

  });

  HomeScreenState copyWith({
    HomeScreenStatus? status,

  }) {
    return HomeScreenState(
      status: status ?? this.status,

    );
  }

  @override
  List<Object?> get props => [
        status,

      ];
}
