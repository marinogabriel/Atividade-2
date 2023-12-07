import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/match.dart';
import '../model/user.dart';
import '../provider/firebase_firestore.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(userId: event.userId, previousUser: event.previousUser));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        FirestoreDatabase.helper.insertUser(event.user);
      } else if (state is UpdateState) {
        FirestoreDatabase.helper
            .updateUser((state as UpdateState).userId, event.user);
        emit(InsertState());
      }
    });

    on<SubmitMatchEvent>((event, emit) {
      if (state is InsertState) {
        FirestoreDatabase.helper.insertMatch(event.match);
      } else if (state is UpdateState) {
        FirestoreDatabase.helper
            .updateMatch((state as UpdateState).userId, event.match);
        emit(InsertState());
      }
    });

    on<DeleteEvent>((event, emit) {
      FirestoreDatabase.helper.deleteUser(event.userId);
    });
  }
}

/*
  Eventos
*/
abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Usuario user;
  SubmitEvent({required this.user});
}

class DeleteEvent extends ManageEvent {
  String userId;
  DeleteEvent({required this.userId});
}

class UpdateRequest extends ManageEvent {
  String userId;
  Usuario previousUser;
  UpdateRequest({required this.userId, required this.previousUser});
}

class SubmitMatchEvent extends ManageEvent {
  Partida match;
  SubmitMatchEvent({required this.match});
}

class UpdateCancel extends ManageEvent {}

/*  
Estados
*/

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String userId;
  Usuario previousUser;
  UpdateState({required this.userId, required this.previousUser});
}
