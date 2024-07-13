class UserReg {
  String? email;
  String? username;
  String? password;

  UserReg({this.email, this.username, this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
      };
}
