import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';
import '../provider/firebase_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthenticationProvider authProvider =
      FirebaseAuthenticationProvider();

  AuthBloc() : super(Unauthenticated()) {
    authProvider.stream.listen((event) {
      add(AuthServerEvent(username: event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.username == null) {
        FirestoreDatabase.helper.username = "default_user";
        emit(Unauthenticated());
      } else {
        FirestoreDatabase.helper.username = event.username;
        emit(Authenticated(username: event.username!));
      }
    });

    on<LoginUser>((LoginUser event, emit) async {
      try {
        await authProvider.signInWithEmailAndPassword(
            event.username, event.password);
        // Se a operação de login for bem-sucedida, emita o estado de autenticação
        emit(Authenticated(username: event.username));
      } catch (e) {
        // Se ocorrer um erro, emita o estado de erro
        emit(AuthError(message: "Erro ao fazer login: $e"));
      }
    });

    on<RegisterUser>((RegisterUser event, emit) async {
      try {
        await authProvider.createUserWithEmailandPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
    on<Logout>(
      (Logout event, Emitter emit) {
        authProvider.signOut();
      },
    );
  }
}

/*
Eventos
*/
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({
    this.username = "",
    this.password = "",
  });
}

class RegisterUser extends AuthEvent {
  String username;
  String password;

  RegisterUser({
    this.username = "",
    this.password = "",
  });
}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  String? username;
  AuthServerEvent({this.username});
}

/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String username;

  Authenticated({this.username = ""});
}

class AuthError extends AuthState {
  String message;

  AuthError({this.message = ""});
}
