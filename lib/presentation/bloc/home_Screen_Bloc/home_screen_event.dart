part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserName extends HomeScreenEvent {}

class GetTransactionsEvent extends HomeScreenEvent {}

class ChangeAnalyticsStatus extends HomeScreenEvent {
  final HomeScreenStatus homeScreenStatus;

  ChangeAnalyticsStatus({
    required this.homeScreenStatus,
  });
}

class GetHomeStats extends HomeScreenEvent {
  final String? startDate;
  final String? endDate;

  GetHomeStats({
    this.endDate,
    this.startDate,
  });
}

class InitStateValuesEvent extends HomeScreenEvent {}
class InitializeData extends HomeScreenEvent {}
