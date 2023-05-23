part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// quando o usuario faz o login com email e senha esse evento e chamado.
// e o [AuthRepository] tambem e chamado
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// quando o usuario faz o login com email e senha esse evento e chamado.
// e o [AuthRepository] tambem e chamado
class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullname;
  final String phone;

  SignUpRequested(this.email, this.password, this.fullname, this.phone);
}

class SignOutRequested extends AuthEvent {}
