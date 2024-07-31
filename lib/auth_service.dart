class AuthService {
  // Mock user data
  final String _mockEmail = 'armeennaeem15@gmail.com';
  final String _mockPassword = 'a123';
  bool _isLoggedIn = false;

  Future<bool> signIn(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    if (email == _mockEmail && password == _mockPassword) {
      _isLoggedIn = true;
      return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 3));
    _isLoggedIn = false;
  }

  bool isLoggedIn() {
    return _isLoggedIn;
  }
}


