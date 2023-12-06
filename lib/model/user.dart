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

  set name(String newTitle) {
    if (newTitle.isNotEmpty) {
      _name = newTitle;
    }
  }

  set email(String newDescription) {
    if (newDescription.isNotEmpty) {
      _email = newDescription;
    }
  }

  set username(String newPath) {
    if (newPath.isNotEmpty) {
      _username = newPath;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["username"] = _username;
    return map;
  }

  String get name => _name;
  String get email => _email;
  String get username => _username;
}
