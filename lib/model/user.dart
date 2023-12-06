class Usuario {
  String _name = "";
  String _email = "";
  String _username = "";

  Usuario() {
    _name = "";
    _email = "";
    _username = "";
  }

  Usuario.withData({name = "", email = "", username = ""}) {
    _name = name;
    _email = email;
    _username = username;
  }

  Usuario.fromMap(map) {
    _name = map["name"];
    _email = map["email"];
    _username = map["username"];
  }
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
    map["username"] = _username;
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    return map;
  }
}
