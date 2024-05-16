class UserModel {
  final int userId;
  final String? name;
  final String email;
  final String password;
  final String? token = '';


  UserModel({
    required this.userId,
    this.name,
    required this.email,
    required this.password,
  });

}
