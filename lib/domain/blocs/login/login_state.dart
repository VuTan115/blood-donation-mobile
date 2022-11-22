part of 'login_bloc.dart';

enum loginStatus {
  initial,
  success,
  failure,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = loginStatus.initial,
    this.username = '',
    this.password = '',
  });

  final loginStatus status;
  final String username;
  final String password;

  LoginState copyWith({
    loginStatus? status,
    String? username,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
