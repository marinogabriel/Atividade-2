import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();
  AuthBloc() : super(Unauthenticated()) {
    on<LoginUser>((LoginUser event, Emitter emit) {
      if (event.password == "senha") {
        emit(Authenticated(email: event.email));
      } else {
        emit(AuthError(message: "Impossível Logar com ${event.email}"));
      }
    });
    on<Logout>((Logout event, Emitter emit) async {
      emit(Unauthenticated());
    });
  }
}

/*Eventos*/
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String email;
  String password;

  LoginUser({required this.email, required this.password});
}

class Logout extends AuthEvent {}

/*Estados*/
abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  String email;
  Authenticated({required this.email});
}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}
