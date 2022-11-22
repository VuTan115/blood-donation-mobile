part of 'page_route_bloc.dart';

abstract class PageRouteEvent extends Equatable {
  const PageRouteEvent();

  @override
  List<Object> get props => [];
}

class PageJumpEvent extends PageRouteEvent {
  const PageJumpEvent({
    required this.currentPageIndex,
  });
  final int currentPageIndex;
  @override
  List<Object> get props => [currentPageIndex];
}
