import 'package:take_home/export.dart';
import 'package:intl/intl.dart' as date;

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeUseCase homeUseCase;

  HomeScreenBloc({required this.homeUseCase}) : super(HomeScreenState()) {

  }




  // void _getTransactionsEvent(
  //   GetTransactionsEvent event,
  //   Emitter<HomeScreenState> emit,
  // ) async {
  //   final response = await homeUseCase.getTransaction();
  //   response.fold(
  //     (transactionsEntity) {
  //       if (transactionsEntity.isEmpty) {
  //         emit(
  //           state.copyWith(
  //             status: HomeScreenStatus.empty,
  //             entity: [],
  //           ),
  //         );
  //       }
  //       if (transactionsEntity.isNotEmpty) {
  //         emit(
  //           state.copyWith(
  //             status: HomeScreenStatus.loaded,
  //             entity: transactionsEntity,
  //           ),
  //         );
  //       }
  //     },
  //     (error) {
  //       emit(
  //         state.copyWith(
  //           status: HomeScreenStatus.error,
  //           entity: [],
  //         ),
  //       );
  //     },
  //   );
  // }

}
