class User {
  String _name = "";
  String _email = "";
  String path = "";

  User() {
    _name = "";
    _email = "";
    path = "";
  }

  User.withData({name = "", email = "", this.path = ""}) {
    _name = name;
    _email = email;
  }

  User.fromMap(map) {
    _name = map["name"];
    _email = map["email"];
    path = map["path"];
  }

  String get name => _name;
  String get email => _email;

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

  toMap() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["path"] = path;
    return map;
  }
}
