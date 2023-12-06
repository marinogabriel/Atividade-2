import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/users.dart';
import '../provider/firebase_firestore.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  UserCollection userCollection = UserCollection();
  StreamSubscription? subscription;

  MonitorBloc() : super(MonitorState(userCollection: UserCollection())) {
    /**/

    on<AskNewList>((event, emit) async {
      //userCollection = await RestDataProvider.helper.getUserList();
      //userCollection = await LocalProvider.helper.getUserList();
      userCollection = await FirestoreDatabase.helper.getUserList();
      emit(MonitorState(userCollection: userCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(userCollection: userCollection));
    });

    on<UpdateStreamSubscription>((event, emit) {
      subscription?.cancel();
      subscription = FirestoreDatabase.helper.stream.listen((event) {
        userCollection = event;
        add(UpdateList());
      });
    });
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
  UserCollection userCollection;
  MonitorState({required this.userCollection});
}
