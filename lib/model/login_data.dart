class LoginData {
  String email;
  String password;
  bool confirmed = false;

  LoginData({required this.email, required this.password});

  doSomething() {
    //print("Username: $email");
    //print("Password: $password");
  }
}
