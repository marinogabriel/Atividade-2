import 'user.dart';

class UserCollection {
  List<String> idList = [];
  List<User> userList = [];

  UserCollection() {
    idList = [];
    userList = [];
  }

  int length() {
    return idList.length;
  }

  // index é a posição da user
  User getUserAtIndex(int index) {
    User user = userList[index];
    return User.withData(
      name: user.name,
      email: user.email,
      username: user.username,
    );
  }

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

  updateOrInsertUserOfId(String id, User user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList[index] = User.withData(
        name: user.name,
        email: user.email,
        username: user.username,
      );
    } else {
      idList.add(id);
      userList.add(
        User.withData(
          name: user.name,
          email: user.email,
          username: user.username,
        ),
      );
    }
  }

  updateUserOfId(String id, User user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList[index] = User.withData(
        name: user.name,
        email: user.email,
        username: user.username,
      );
    }
  }

  deleteUserOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertUserOfId(String id, User user) {
    idList.add(id);
    userList.add(
      User.withData(
        name: user.name,
        email: user.email,
        username: user.username,
      ),
    );
  }
}
