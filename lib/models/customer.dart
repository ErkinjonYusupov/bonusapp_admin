class CustomerModel {
  int id;
  String name;
  String username;
  String code;
  int summa;

  CustomerModel({
    required this.code,
    required this.id,
    required this.name,
    required this.summa,
    required this.username,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        code: json['code'],
        id: json['id'],
        name: json['name'],
        summa: json['summa'],
        username: json['username']);
  }
}
