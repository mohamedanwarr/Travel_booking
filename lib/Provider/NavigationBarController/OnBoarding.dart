import 'package:flutter/material.dart';
class OnBoardingscreen extends ChangeNotifier {
  static int _curruntindex = 0;
  PageController? _controller;

  OnBoardingscreen() {
    _controller = PageController(initialPage: _curruntindex);
  }

  int get currentindex => _curruntindex;
  PageController? get controller => _controller;

  void navigate(int newIndex) {
    _curruntindex = newIndex;
    _controller!.animateToPage(
      _curruntindex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
