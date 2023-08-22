import 'package:flutter/cupertino.dart';

class MainScreenProvider extends ChangeNotifier{
  int _PageIndex=0;
  int get pageIndex=>_PageIndex;

  set pageIndex (int newIndex){
    _PageIndex=newIndex;
    notifyListeners();
  }
  void setpageIndex (int newIndex){
    _PageIndex=newIndex;
    
  }
}
