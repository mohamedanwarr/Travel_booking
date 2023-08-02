import 'package:flutter/cupertino.dart';

class LanguageProvider with ChangeNotifier{
  String _selectedLanguage='en';
  bool _isHidenPassword = true;
  String get selectedLanguage => _selectedLanguage;
      void changeLanguage(String? languagecode){
    _selectedLanguage=languagecode!;
    notifyListeners();
      }
      bool get isHidenPassword =>_isHidenPassword;
      void togglePasswordcheck(){
        if(_isHidenPassword==true){
           _isHidenPassword = false;
        }else {
        _isHidenPassword =true;
        }
        notifyListeners();
      }

}