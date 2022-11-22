import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

class BlocObserverExtend extends BlocObserver {
  final Logger _logger;
  BlocObserverExtend() : _logger = Logger('BlocObserverExtend');

  // Called whenever an [event] is `added` to any [bloc] with the given [bloc] and [event].
  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
  }
}
