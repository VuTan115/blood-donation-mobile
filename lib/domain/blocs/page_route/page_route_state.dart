part of 'page_route_bloc.dart';

class PageRouteState extends Equatable {
  const PageRouteState({this.currentPageIndex = 0, this.status = ''});

  final int currentPageIndex;
  final String status;

  PageRouteState copyWith({required int eventIndex, required String status}) {
    return PageRouteState(currentPageIndex: eventIndex, status: status);
  }

  @override
  List<Object> get props => [currentPageIndex];
}
