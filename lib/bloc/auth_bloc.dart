import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';
import '../model/user_model.dart';
import '../provider/firebase_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.user == null) {
        emit(Unauthenticated());
      } else {
        FirestoreDatabase.helper.username = event.user!.email;
        emit(Authenticated(user: event.user!));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(
            event.email, event.password);
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.email, event.password);
      } catch (e) {
        emit(AuthError(
            message: "Impossível Logar com ${event.email}: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efetuar Logout: ${e.toString()}"));
      }
    });
  }
}

/*
   Eventos
*/
abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String email;
  String password;

  RegisterUser({required this.email, required this.password});
}

class LoginUser extends AuthEvent {
  String email;
  String password;

  LoginUser({required this.email, required this.password});
}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? user;
  AuthServerEvent(this.user);
}

/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  UserModel user;
  Authenticated({required this.user});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
