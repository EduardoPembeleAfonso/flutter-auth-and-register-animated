
import 'package:bloc/bloc.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticaded()) {
    /* Quando o utilizador premir o botão SignIn,
     enviaremos o evento SignInRequested para o AuthBloc para o tratar e emitir 
     o estado Autenticado se o utilizador estiver autenticado*/
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticaded());
      }
    });

    /**
   * Quando o utilizador premir o botão SignUp, enviaremos o evento SignUpRequest
   *  para o AuthBloc para o tratar e emitir o estado Autenticado se o utilizador for autenticado
   */
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password,
            fullname: event.fullname, phone: event.phone, );
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticaded());
      }
    });

    /**
     * Quando o utilizador premir o botão SignOut, enviaremos o evento 
     * SignOutRequested para o AuthBloc para o tratar e emitir o estado
     *  UnAuthenticated
     */
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticaded());
    });
  }
}
