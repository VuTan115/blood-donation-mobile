import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class GlobalKeys {
  // Used for MainPage Scaffold
  static final GlobalKey<ScaffoldState> mainScaffold =
      GlobalKey<ScaffoldState>();

  // Used for MaterialApp, coordinated by AppRoute
  static final  appNavigatorKey =
      GlobalKey<NavigatorState>();

  // Used for HomePage, coordinated by HomePage Navigator
  static final GlobalKey<NavigatorState> homeNavigator =
      GlobalKey<NavigatorState>();
  // Used for MaterialApp, coordinated by AppRoute
  static final GlobalKey<NavigatorState> bottomBarKey =
      GlobalKey<NavigatorState>();

  static final PageController  pageController = PageController();
}
