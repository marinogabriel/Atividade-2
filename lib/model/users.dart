import 'user.dart';

class UserCollection {
  List<String> idList = [];
  List<Usuario> userList = [];

  UserCollection() {
    idList = [];
    userList = [];
  }

  int length() {
    return idList.length;
  }

  // index é a posição da user
  Usuario getUserAtIndex(int index) {
    Usuario user = userList[index];
    return Usuario.withData(
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

  updateOrInsertUserOfId(String id, Usuario user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList[index] = Usuario.withData(
        name: user.name,
        email: user.email,
        username: user.username,
      );
    } else {
      idList.add(id);
      userList.add(
        Usuario.withData(
          name: user.name,
          email: user.email,
          username: user.username,
        ),
      );
    }
  }

  updateUserOfId(String id, Usuario user) {
    int index = getIndexOfId(id);
    if (index != -1) {
      userList[index] = Usuario.withData(
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

  insertUserOfId(String id, Usuario user) {
    idList.add(id);
    userList.add(
      Usuario.withData(
        name: user.name,
        email: user.email,
        username: user.username,
      ),
    );
  }
}
