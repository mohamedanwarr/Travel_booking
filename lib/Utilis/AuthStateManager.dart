class AuthStateManager {
  String? _currentAuthProvider;

  void setCurrentAuthProvider(String provider) {
    _currentAuthProvider = provider;
  }

  String? getCurrentAuthProvider() {
    return _currentAuthProvider;
  }

  void clearAuthProvider() {
    _currentAuthProvider = null;
  }
}