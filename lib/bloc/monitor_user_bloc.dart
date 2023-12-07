import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user.dart';
import '../provider/firebase_firestore.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  Usuario user = Usuario();
  StreamSubscription? subscription;

  MonitorBloc() : super(MonitorState(user: Usuario())) {
    /**/

    on<AskNewList>((event, emit) async {
      //noteCollection = await RestDataProvider.helper.getNoteList();
      //noteCollection = await LocalProvider.helper.getNoteList();
      //user = await FirestoreDatabase.helper.getUser();
      emit(MonitorState(user: user));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(user: user));
    });

    /*on<UpdateStreamSubscription>((event, emit) {
      subscription?.cancel();
      subscription = FirestoreDatabase.helper.stream.listen((event) {
        user = event;
        add(UpdateList());
      });
    });
*/
    add(AskNewList());
  }
}

/*
Eventos
*/
abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

class UpdateStreamSubscription extends MonitorEvent {}

/*
Estados
*/
class MonitorState {
  Usuario user;
  MonitorState({required this.user});
}
