class User {
  String _uid = "";
  String _name = "";
  String _email = "";
  String _username = "";

  User() {
    _uid = "";
    _name = "";
    _email = "";
    _username = "";
  }

  User.withData({uid = "", name = "", email = "", username = ""}) {
    _uid = uid;
    _name = name;
    _email = email;
    _username = username;
  }

  User.fromMap(map) {
    _name = map["name"];
    _email = map["email"];
    _username = map["username"];
  }

  String get uid => _uid;
  String get name => _name;
  String get email => _email;
  String get username => _username;

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

  toMap() {
    var map = <String, dynamic>{};
    map["uid"] = _uid;
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    return map;
  }
}
