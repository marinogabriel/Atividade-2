class Usuario {
  String _uid = "";
  String _name = "";
  String _email = "";
  String _username = "";
  String _path = "";

  Usuario() {
    _uid = "";
    _name = "";
    _email = "";
    _username = "";
    _path = "";
  }

  Usuario.withData(
      {uid = "", name = "", email = "", username = "", path = ""}) {
    _uid = uid;
    _name = name;
    _email = email;
    _username = username;
    _path = "";
  }

  Usuario.fromMap(map) {
    _uid = map["uid"];
    _name = map["name"];
    _email = map["email"];
    _username = map["username"];
    _path = map["path"];
  }
  String get uid => _uid;
  String get name => _name;
  String get email => _email;
  String get username => _username;
  String get path => _path;

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  set email(String newEmail) {
    if (newEmail.isNotEmpty) {
      _email = newEmail;
    }
  }

  set username(String newUsername) {
    if (newUsername.isNotEmpty) {
      _username = newUsername;
    }
  }

  set path(String newPath) {
    if (newPath.isNotEmpty) {
      _path = newPath;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["uid"] = _uid;
    map["username"] = _username;
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    map["path"] = _path;
    return map;
  }
}
