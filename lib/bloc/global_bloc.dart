import 'dart:async';
import 'dart:math';

import 'package:rxdart/rxdart.dart';

StreamSubscription stream;

class StartState {
  final int loaded;
  final int loading;
  final int awaiting;
  StartState({this.loaded, this.loading, this.awaiting});
}

class GlobalBloc {
  BehaviorSubject<StartState> _subject = BehaviorSubject<StartState>();
  BehaviorSubject<StartState> get subject => _subject;
  int _loaded = 0, _awaiting = 0, _loading = 0;

  Stream timeStream() {
    return Stream.periodic(Duration(microseconds: 1), (i) {
      while (_awaiting != 0 && _loading != 3) {
        Timer(Duration(seconds: random(3, 11)), _loadedFile);
        _awaiting--;
        _loading++;
      }
      if (_loaded < 0) _loaded = 0;
      if (_loading < 0) _loading = 0;
      if (_awaiting < 0) _awaiting = 0;
      subject.sink.add(
          StartState(loaded: _loaded, loading: _loading, awaiting: _awaiting));
    });
  }

  void _loadedFile() {
    _loading--;
    _loaded++;
  }

  void deleteFile(String text) {
    if (text == "Loaded") _loaded--;
    if (text == "Loading") _loading--;
    if (text == "Awaiting") _awaiting--;
  }

  void deleteFiles() {
    _loading = 0;
    _loaded = 0;
  }

  int random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  void addFiles() {
    _awaiting++;
  }

  void dispose() {
    _subject.close();
  }
}

final bloc = GlobalBloc();
