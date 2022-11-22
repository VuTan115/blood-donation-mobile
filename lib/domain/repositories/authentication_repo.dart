import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    Future<void> logOut() async {
      try {
        await Future.wait([
          // _firebaseAuth.signOut(),
          GoogleSignIn().signOut(),
        ]);
      } catch (_) {
        // throw LogOutFailure();
      }
    }
  }

  void dispose() => _controller.close();
}
