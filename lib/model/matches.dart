import 'match.dart';

class MatchCollection {
  List<String> idList = [];
  List<Partida> matchList = [];

  MatchCollection() {
    idList = [];
    matchList = [];
  }

  int length() {
    return idList.length;
  }

  Partida getMatchAtIndex(int index) {
    Partida match = matchList[index];
    return Partida.withData(
        email: match.email,
        size: match.size,
        date: match.date,
        duration: match.duration,
        win: match.win);
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    return idList.indexOf(id);

    // for (int i = 0; i < idList.length; i++) {
    //   if (id == idList[i]) {
    //     return i;
    //   }
    // }

    // return -1;
  }

  updateOrInsertMatchOfId(String id, Partida match) {
    int index = getIndexOfId(id);
    if (index != -1) {
      matchList[index] = Partida.withData(
          email: match.email,
          size: match.size,
          date: match.date,
          duration: match.duration,
          win: match.win);
    } else {
      idList.add(id);
      matchList.add(
        Partida.withData(
            email: match.email,
            size: match.size,
            date: match.date,
            duration: match.duration,
            win: match.win),
      );
    }
  }

  updateMatchOfId(String id, Partida match) {
    int index = getIndexOfId(id);
    if (index != -1) {
      matchList[index] = Partida.withData(
          email: match.email,
          size: match.size,
          date: match.date,
          duration: match.duration,
          win: match.win);
    }
  }

  deleteMatchOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      matchList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertMatchOfId(String id, Partida match) {
    idList.add(id);
    matchList.add(
      Partida.withData(
          email: match.email,
          size: match.size,
          date: match.date,
          duration: match.duration,
          win: match.win),
    );
  }
}
