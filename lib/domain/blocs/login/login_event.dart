part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.username, required this.password});
  final String username;
  final String password;
  
  @override
  List<Object> get props => [username, password];
}

class LoginWithGooglePressed extends LoginEvent {
  const LoginWithGooglePressed();
  @override
  List<Object> get props => [];
}
class Logout extends LoginEvent {
  const Logout();
  @override
  List<Object> get props => [];
}