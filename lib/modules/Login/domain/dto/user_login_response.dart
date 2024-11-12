class UserLoginResponse {
  String username;
  String email;
  String accesToken;

  UserLoginResponse({
    required this.username,
    required this.email,
    required this.accesToken,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      username: json['username'],
      email: json['email'],
      accesToken: json["accessToken"],
    );
  }
}
