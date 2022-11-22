import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/app/utils/constances.dart';
import 'package:personal_financial_management/domain/blocs/auth_bloc/authentication_bloc.dart';
import 'package:personal_financial_management/domain/models/user.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginWithGooglePressed>(_onLoginWithGooglePressed);
    on<Logout>(_onLogout);
  }

  final AuthenticationRepository _authenticationRepository;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: clientId,
    signInOption: SignInOption.standard,
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final String username = event.username;
    emit(state.copyWith(
      username: username,
      status: username.isEmpty ? loginStatus.loading : loginStatus.failure,
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final String password = event.password;

    emit(state.copyWith(
      password: password,
      status: password.isEmpty ? loginStatus.loading : loginStatus.failure,
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter emit,
  ) async {
    final String username = event.username.trim();
    final String password = event.password.trim();
    try {
      emit(state.copyWith(status: loginStatus.loading));
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      if (userCredential.user != null) {
        // emit authenticated state to the authentication bloc
        //   emit(AuthenticationState.authenticated(
        //     MyUser.copyWith(
        //         uid: userCredential.user!.uid,
        //         name: userCredential.user!.displayName,
        //         email: userCredential.user!.email,
        //         phone: userCredential.user!.phoneNumber,
        //         address: userCredential.user!.providerData[0].providerId,
        //         role: userCredential.user!.providerData[0].providerId,
        //         createdAt: userCredential.user!.metadata.creationTime.toString(),
        //         status: userCredential.user!.metadata.lastSignInTime.toString(),
        //         refreshToken: userCredential.user!.refreshToken),
        //   ));
        return emit(state.copyWith(status: loginStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(status: loginStatus.failure));
      throw e;
    }

    return emit(state.copyWith(status: loginStatus.failure));
  }

  void _onLoginWithGooglePressed(
    LoginWithGooglePressed event,
    Emitter emit,
  ) async {
    emit(state.copyWith(status: loginStatus.loading));
    final isSignedIn = await _googleSignIn.isSignedIn();

    if (isSignedIn) {
      try {
        await _googleSignIn.disconnect();
      } catch (e) {}
    }
    try {
      final GoogleSignInAccount? userCredential = await _googleSignIn.signIn();
      if (userCredential != null) {
        emit(state.copyWith(status: loginStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(status: loginStatus.failure));
    }
  }

  void _onLogout(Logout event, Emitter emit) async {
    emit(state.copyWith(status: loginStatus.loading));
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    emit(state.copyWith(status: loginStatus.failure));
  }
}
