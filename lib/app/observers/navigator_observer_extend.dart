import 'package:flutter/material.dart';

//key: GlobalKeys.main5NavigatorState,
//observers: <NavigatorObserver>[
//NavigatorObserverExtend(callback: Callback()),
//],

class NavigatorObserverExtend extends NavigatorObserver {
  NavigatorObserverExtend(
      {required this.callback,
      required this.pushCallback,
      required this.popCallback,
      required this.replaceCallback});

  final VoidCallback callback;
  final VoidCallback pushCallback;
  final VoidCallback popCallback;
  final VoidCallback replaceCallback;

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushCallback();
    callback();
  }

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    popCallback();
    callback();
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    replaceCallback();
    callback();
  }
}
