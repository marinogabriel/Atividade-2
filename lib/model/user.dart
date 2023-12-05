class User {
  String _name = "";
  String _email = "";
  String _path = "";

  User() {
    _name = "";
    _email = "";
    _path = "";
  }

  User.withData({name = "", email = "", path = ""}) {
    _name = name;
    _email = email;
    _path = path;
  }

  User.fromMap(map) {
    _name = map["name"];
    _email = map["email"];
    _path = map["path"];
  }

  String get name => _name;
  String get email => _email;
  String get path => _path;

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

  set path(String newPath) {
    if (newPath.isNotEmpty) {
      _path = newPath;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["email"] = _email;
    map["path"] = _path;
    return map;
  }
}
