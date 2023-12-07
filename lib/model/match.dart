import 'package:time/time.dart';

class Partida {
  String _email = "";
  String _size = "";
  DateTime _date = 0.seconds.fromNow;
  int _duration = 0;
  int _win = 0;

  Partida() {
    _email = "";
    _size = "";
    _date = 0.seconds.fromNow;
    _duration = 0;
    _win = 0;
  }

  Partida.withData(
      {email = "", size = "", date = "", duration = "", win = ""}) {
    _email = email;
    _size = size;
    _date = date;
    _duration = duration;
    _win = win;
  }

  Partida.fromMap(map) {
    _email = map["email"];
    _size = map["size"];
    _date = map["date"];
    _duration = map["duration"];
    _win = map["win"];
  }

  String get email => _email;
  String get size => _size;
  DateTime get date => _date;
  int get duration => _duration;
  int get win => _win;

  set email(String newemail) {
    if (newemail.isNotEmpty) {
      _email = newemail;
    }
  }

  set size(String newsize) {
    if (newsize.isNotEmpty) {
      _size = newsize;
    }
  }

  set date(DateTime newdate) {
    if (newdate.toString().isNotEmpty) {
      _date = newdate;
    }
  }

  set duration(int newduration) {
    _duration = newduration;
  }

  set win(int win) {
    _win = win;
  }

  toMap() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["email"] = _email;
    map["size"] = _size;
    map["date"] = _date;
    map["duration"] = _duration;
    map["win"] = _win;
    return map;
  }
}
