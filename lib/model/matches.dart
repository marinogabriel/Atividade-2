import 'match.dart';

class MatchCollection {
  List<String> idList = [];
  List<Match> matchList = [];

  MatchCollection() {
    idList = [];
    matchList = [];
  }

  int length() {
    return idList.length;
  }

  // index é a posição da match
  // Match getMatchAtIndex(int index) {
  //   Match match = matchList[index];
  //   return Match.withData(
  //       userId: match.userId,
  //       size: match.size,
  //       date: match.date,
  //       duration: match.duration,
  //       win: match.win);
  // }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    return idList.indexOf(id);
    /*
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }*/

    // return -1;
  }

  // updateOrInsertMatchOfId(String id, Match match) {
  //   int index = getIndexOfId(id);
  //   if (index != -1) {
  //     matchList[index] = Match.withData(
  //         userId: match.userId,
  //         size: match.size,
  //         date: match.date,
  //         duration: match.duration,
  //         win: match.win);
  //   } else {
  //     idList.add(id);
  //     matchList.add(
  //       Match.withData(
  //           userId: match.userId,
  //           size: match.size,
  //           date: match.date,
  //           duration: match.duration,
  //           win: match.win),
  //     );
  //   }
  // }

  // updateMatchOfId(String id, Match match) {
  //   int index = getIndexOfId(id);
  //   if (index != -1) {
  //     matchList[index] = Match.withData(
  //         userId: match.userId,
  //         size: match.size,
  //         date: match.date,
  //         duration: match.duration,
  //         win: match.win);
  //   }
  // }

  // deleteMatchOfId(String id) {
  //   int index = getIndexOfId(id);
  //   if (index != -1) {
  //     matchList.removeAt(index);
  //     idList.removeAt(index);
  //   }
  // }

  // insertMatchOfId(String id, Match match) {
  //   idList.add(id);
  //   matchList.add(
  //     Match.withData(
  //         userId: match.userId,
  //         size: match.size,
  //         date: match.date,
  //         duration: match.duration,
  //         win: match.win),
  //   );
  // }
}
