import 'package:flutter/cupertino.dart';

class VideoPlayerProvider with ChangeNotifier{
  bool _isPlaying = true;
  bool get isPlaying => _isPlaying;
  void toggleIsPlaying() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}