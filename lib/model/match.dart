import 'dart:js_interop';
import 'package:time/time.dart';

class Partida {
  String _userId = "";
  String _size = "";
  DateTime _date = 0.seconds.fromNow;
  int _duration = 0;
  bool _win = false;

  Partida() {
    _userId = "";
    _size = "";
    _date = 0.seconds.fromNow;
    _duration = 0;
    _win = false;
  }

  Partida.withData(
      {userId = "", size = "", date = "", duration = "", win = ""}) {
    _userId = userId;
    _size = size;
    _date = date;
    _duration = duration;
    _win = win;
  }

  Partida.fromMap(map) {
    _userId = map["userId"];
    _size = map["size"];
    _date = map["date"];
    _duration = map["duration"];
    _win = map["win"];
  }

  String get userId => _userId;
  String get size => _size;
  DateTime get date => _date;
  int get duration => _duration;
  bool get win => _win;

  set userId(String newuserId) {
    if (newuserId.isNotEmpty) {
      _userId = newuserId;
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

  set win(bool win) {
    _win = win;
  }

  toMap() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["userId"] = _userId;
    map["size"] = _size;
    map["date"] = _date;
    map["duration"] = _duration;
    return map;
  }
}
