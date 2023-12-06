class RegisterData {
  String name;
  String username;
  String email;
  String password;
  String confirmPassword;
  bool confirmed = false;

  RegisterData(
      {required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.confirmPassword});

  doSomething() {
    //print("Username: $email");
    //print("Password: $password");
  }
}
