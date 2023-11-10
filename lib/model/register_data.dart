class RegisterData {
  String name;
  String user;
  String email;
  String password;
  String confirmPassword;
  bool confirmed = false;

  RegisterData(
      {required this.name,
      required this.user,
      required this.email,
      required this.password,
      required this.confirmPassword});

  doSomething() {
    //print("Username: $email");
    //print("Password: $password");
  }
}
