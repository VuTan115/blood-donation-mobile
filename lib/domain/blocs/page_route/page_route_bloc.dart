import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_route_event.dart';
part 'page_route_state.dart';

class PageRouteBloc extends Bloc<PageRouteEvent, PageRouteState> {
  PageRouteBloc() : super(const PageRouteState()) {
    on<PageJumpEvent>(_onPageJumpEvent);
  }

  void _onPageJumpEvent(
    PageJumpEvent event,
    Emitter<PageRouteState> emit,
  ) async {
    emit(state.copyWith(
      eventIndex: event.currentPageIndex,
      status: "PageJumpEvent${event.currentPageIndex}",
    ));
  }
}
