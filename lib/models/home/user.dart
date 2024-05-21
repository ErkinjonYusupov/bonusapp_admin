class UserModel {
  int id;
  String name;
  String username;

  UserModel({required this.id, required this.name, required this.username});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], name: json['name'], username: json['username']);
  }
}
