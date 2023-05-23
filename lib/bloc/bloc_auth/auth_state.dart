part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

// Quando o usuario clica no botao de login ou registro muda o seu estado
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// Quando o usuario esta autenticado muda o seu estado
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// Estado Inicial do bloc.
// Quando usuario nao esta autenticado muda o seu estatdo para nao autenticado
class UnAuthenticaded extends AuthState {
  @override
  List<Object?> get props => [];
}

// Se ocorrer qualquer erro o estatdo muda para o AuthError
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}
