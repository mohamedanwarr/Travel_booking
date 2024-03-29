import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _selectedLanguage = 'en';

  bool _isHidenPassword = true;
  bool _isloading = false;
  bool _isContainer1Selected = false;

  String get selectedLanguage => _selectedLanguage;

  Future<void> loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedLanguage = prefs.getString('selectedLanguage') ?? 'en';
    notifyListeners();
  }

  Future<void> saveSelectedLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', languageCode);
    _selectedLanguage = languageCode;
    notifyListeners();
  }

  void changeLanguage(String? languagecode) {
    _selectedLanguage = languagecode!;
    notifyListeners();
  }

  //method Hide password in textfiled

  bool get isHidenPassword => _isHidenPassword;

  void togglePasswordcheck() {
    if (_isHidenPassword == true) {
      _isHidenPassword = false;
    } else {
      _isHidenPassword = true;
    }
    notifyListeners();
  }

  // loading
  bool get isloading => _isloading;

  void loading() {
    _isloading = true;
    notifyListeners();
  }

  // choose
  bool get isContainer1Selected => _isContainer1Selected;

  void choosecolor() {
    _isContainer1Selected = !_isContainer1Selected;
    notifyListeners();
  }
}
